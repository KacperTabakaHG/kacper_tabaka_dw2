###DEEL 1: instructies voor het BUILDenvan de IMAGE

FROM ubuntu:20.04
# We starten vanaf de bestaande “ubuntu”-image (tag: 20.04)
# deze image wordt van de registry (Docker Hub) gehaald.

RUN apt update

ENV DEBIAN_FRONTEND=noninteractive
# Bovenstaande lijn is nodig omdat er anders naar de timezone gevraagd wordt
# tijdens de installatie van Apache

RUN apt install -y apache2
RUN apt install -y php

COPY html /var/www/html/
# Kopieer de inhoud van “html”(op de host)
# naar “/var/www/html”(in de image).

###DEEL 2: extra details voor bij het RUNNENvan een CONTAINER

WORKDIR /var/www/html/
# Directory waar je terecht komt als je inlogt op een draaiende container

EXPOSE 80/tcp

# Binnen deze image/containerzal poort 80 (over TCP) gebruikt worden.
# Je kan deze poort beschikbaar maken vanop de host met:
# "docker run–d –t -p [<host-ip>:]<host-port>:80<image>"
# Bijvoorbeeld: docker run –d –t –p 8123:80 zal poort 80 van binnen
# de docker container forwarden naar poort 8123 op de docker host.
# (vergelijk dit met de port-forwarding bij VirtualBox)

# Dit EXPOSE-commando is niet strikt noodzakelijk, maar het is goed
#om dit toch te gebruiken in de Docker file
# (als documentatie voor andere developers)

CMD service apache2 start && bash


RUN date > /var/www/html/buildtime.txt