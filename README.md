# Custom NetBox Image

Custom NetBox Docker image, based on [`netboxcommunity/netbox`](https://hub.docker.com/r/netboxcommunity/netbox), with extra plugins preinstalled.

The plugins are listed in [`plugin_requirements.txt`](plugin_requirements.txt).

## Using the image

Prebuilt images are published to the GitHub Container Registry on every release:

```bash
docker pull ghcr.io/<owner>/<repo>:latest
```

You can use it as a drop-in replacement for the `netboxcommunity/netbox` image in [netbox-docker](https://github.com/netbox-community/netbox-docker). Remember that you also have to enable and configure each plugin in your NetBox `plugins.py`, as described in that plugin's documentation, and then restart NetBox.

Refer to [the official documentation](https://github.com/netbox-community/netbox-docker/wiki/Using-Netbox-Plugins) if needed.

## Building

CI builds the image on every pull request and push to `main` without pushing it. When you publish a GitHub release, CI pushes it to `ghcr.io/<owner>/<repo>` and tags it with the release tag, its semver variants and `latest`.

To build it manually:

```bash
docker build -t custom-netbox-image:dev .
# Optionally pin the NetBox base version
docker build --build-arg NETBOX_VERSION=v4.4 -t custom-netbox-image:dev .
```

If custom configuration files are needed, they can be added to a `configuration/` directory and copied into the image (see the commented lines in the [`Dockerfile`](Dockerfile)). Bear in mind that the deployment will usually override them.
