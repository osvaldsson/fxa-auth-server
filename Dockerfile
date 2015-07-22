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

RUN mkdir -p /home/fxa/content-server

ADD . /home/fxa/content-server/

WORKDIR /home/fxa/content-server

# Run the Auth server

EXPOSE 9000
EXPOSE 9001
EXPOSE 7000

ENTRYPOINT ["npm"]
CMD ["start"]
