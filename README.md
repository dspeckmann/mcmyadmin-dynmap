# mcmyadmin-dynmap

## Description

This is an extension of the image jchaney/mcmyadmin, so most credit goes to him. The changes are:

- Dynmap extension is installed and activated and port 8123 is exposed
- The initial password is set only once at build time so that it is not reset on every restart
- libgdiplus is installed to fix banner image generation and prevent exceptions

NOTE: The actual Dynmap server plugin has to be installed and configured manually! This can happen via the McMyAdmin interface or by mounting the plugins directory. This image only comes with the McMyAdmin extension.

## Configuration

Most configuration (like setting the server address or how much RAM Java should use) can be done via the `McMyAdmin.conf` file. You can mount it like this:

`docker run -d --name mcmyadmin -p 8080:8080 -p 25565:25565 -p 8123:8123 -v "$PWD/McMyAdmin.conf:/home/minecraft/mcmyadmin/McMyAdmin.conf" dspeckmann/mcmyadmin-dynmap`

To start out, you can get the current McMyAdmin.conf from the container like this:

`docker exec mcmyadmin cat /home/minecraft/mcmyadmin/McMyAdmin.conf > McMyAdmin.conf`

If you are running this image on a public server and not just your own computer, which is likely, you also have to configure the Dynmap extension to use the actual path to your server. The relevant line can be found inside `/home/minecraft/mcmyadmin/Modern/Extensions/Dynmap/Config.js`, which can be mounted similar to `McMyAdmin.conf`.

## Run

`docker run -d --name mcmyadmin -p 8080:8080 -p 25565:25565 -p 8123:8123 dspeckmann/mcmyadmin-dynmap`

The initial password is `pass123` and you will be prompted to change it the first time you log in.
