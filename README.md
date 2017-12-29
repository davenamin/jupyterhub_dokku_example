## example scripts to deploy basic JupyterHub instance to Dokku ##
these scripts should help anyone with a server running
[Dokku](http://dokku.viewdocs.io/dokku/) get a quick-and-dirty running
instance of [JupyterHub](https://github.com/jupyterhub/jupyterhub)
using [GitHub](https://github.com) for authentication.

### prerequisites ###

* a server running [Dokku](https://github.com/dokku/dokku)
* the Dokku [letsencrypt plugin](https://github.com/dokku/dokku-letsencrypt)

### known gotchas ###
the Dokku app doesn't have any volumes or mounts to the host. that is,
**you will lose all of your data when the app shuts down**. this is
quick-and-dirty after all!

the JupyterHub instance uses the default single-user spawner. **it
might be easy for one user to bring down your server**.

### get it going already! ###
* create an [OAuth application at
  GitHub](https://github.com/settings/applications/new) - use
  `https://<appname>.<example.com>/hub/oauth_callback` as the
  Authorization callback URL, where `<appname>` and `<example.com>`
  are replaced with the desired Dokku app name and the domain name of
  the server running Dokku respectively.
* change `jupyterhub_config.py` to have `server_url` set to
  `https://<appname>.<example.com>`, from before.
* change `jupyterhub_config.py` to have `admins` put to your username
  on GitHub inside the `{}`.
* change `jupyterhub_config.py` to have `github_clientid` and
  `github_clientsecret` set to values from the OAuth application at
  GitHub (if you lose the page, you can find it again at Profile
  Settings -> Developer Settings -> OAuth Apps).
* change `deploy.sh` to have `APP_NAME=<appname>` and
  `SERVER_NAME=<example.com>`. you may have to `chmod +x deploy.sh` as
  well.
* execute `./deploy.sh` from some flavor of bash and keep your fingers
  crossed!
