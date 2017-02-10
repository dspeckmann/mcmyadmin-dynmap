FROM            jchaney/mcmyadmin
MAINTAINER      Danny Speckmann <danny.speckmann@live.de>

USER            root

RUN             apt-get update
RUN             apt-get install -y libgdiplus git

USER            minecraft

RUN             git clone https://github.com/isitgeorge/McMyAdmin-Extension-Dynmap.git /home/minecraft/mcmyadmin/Modern/Extensions/Dynmap
RUN             /home/minecraft/mcmyadmin/MCMA2_Linux_x86_64 -setpass pass123 -configonly
RUN             sed -i 's/McMyAdmin.LoadExtensions=/&Dynmap/' /home/minecraft/mcmyadmin/McMyAdmin.conf

EXPOSE          8080
EXPOSE          25565
EXPOSE          8123

ENTRYPOINT      /home/minecraft/mcmyadmin/MCMA2_Linux_x86_64
