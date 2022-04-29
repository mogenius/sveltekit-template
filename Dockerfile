FROM node:lts-alpine AS build

WORKDIR /app

COPY app/package*.json .
RUN npm ci
RUN npm audit fix; exit 0
COPY app .
RUN npm run build


FROM node:lts-alpine

WORKDIR /app
RUN adduser -S app

COPY --from=build /app/package*.json .
COPY --from=build /app/processes.json .
RUN npm ci --production --ignore-scripts
RUN npm audit fix; exit 0
COPY --from=build /app/build ./

RUN chown -R app /app
USER app

EXPOSE 3000
CMD ["npm", "run", "pm2"]
