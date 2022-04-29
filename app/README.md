# Sveltekit template
This is a dockerfile template to run Sveltekit on [mogenius](https://mogenius.com). We use it to deploy Svelte from our service library. If you want to run your own Redis on mogenius feel free to add this dockerfile to your project.
## Deployment on mogenius
[mogenius](https://mogenius.com) is the easiest way to run any application in the cloud. It's free, so [sign up now](https://studio.mogenius.com/user/registration) and deploy your app with mogenius.
- Read the docs: [docs.mogenius.com](https://docs.mogenius.com)
- Join our Discord community: [discord.gg/WSxnFHr4qm](https://discord.gg/WSxnFHr4qm)
- Submit your ideas: [feedback.mogenius.com](https://feedback.mogenius.com)


# Makefile

## ATTENTION!
The docker commands in this Makefile are removing unnamed/untagged containers/images before execution. If you do not want this behavior/cleanup please remove `docker-rm-*` from the prodction commands

---
## Development

**First installation**

`make build`

**Run dev**

`make run`

---
## Production (building and running Docker)

**Build docker image**

`make build env=prod`

**Run docker image**

`make run env=prod`

# Sveltekit
Check out [SvelteKit](https://kit.svelte.dev), the official framework for building web applications of all sizes, with a beautiful development experience and flexible filesystem-based routing.*

*Looking for a shareable component template instead? You can [use SvelteKit for that as well](https://kit.svelte.dev/docs#packaging) or the older [sveltejs/component-template](https://github.com/sveltejs/component-template)*