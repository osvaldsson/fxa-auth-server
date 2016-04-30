##########################################################
#                  /!\ WARNING /!\                       #
# This is completely experimental. Use at your own risk. #
#             Also, learn you some docker:               #
#           http://docker.io/gettingstarted              #
##########################################################

FROM node:0.10-onbuild
MAINTAINER Olafur Osvaldsson <osvaldsson@icelandic.net>

# Base system setup

RUN useradd --create-home fxa

USER fxa

RUN mkdir -p /home/fxa/auth-server

ADD . /home/fxa/auth-server/

WORKDIR /home/fxa/auth-server

# Run the Auth server

EXPOSE 9000
EXPOSE 9001
EXPOSE 7000

# Generate the keys

RUN node /home/fxa/auth-server/scripts/gen_keys.js

ENTRYPOINT ["/home/fxa/auth-server/scripts/start-server.sh"]
