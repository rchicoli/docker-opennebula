FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

COPY apt-opennebula.key /apt-opennebula.key

RUN apt-key add apt-opennebula.key \
 && echo "deb http://downloads.opennebula.org/repo/4.14/Debian/8 stable opennebula" > /etc/apt/sources.list.d/opennebula.list

RUN apt-get update \
 && apt-get install -y opennebula opennebula-flow opennebula-gate opennebula-tools opennebula-sunstone

RUN echo 'oneadmin:admin' > /var/lib/one/.one/one_auth

RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/one/sunstone-server.conf

