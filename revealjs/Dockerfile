FROM ubuntu:13.10

MAINTAINER Peter Parente <parente@cs.unc.edu>

RUN apt-get update
RUN apt-get -y -q install ca-certificates

RUN apt-get install -y -q software-properties-common
RUN add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update

RUN apt-get -y -q install wget
RUN apt-get -y -q install nodejs

RUN wget https://github.com/hakimel/reveal.js/archive/2.6.1.tar.gz
RUN tar xzf 2.6.1.tar.gz
RUN mv /reveal.js-2.6.1 /revealjs

RUN mkdir -p /revealjs/md

WORKDIR /revealjs

RUN npm install -g grunt-cli
RUN npm install
RUN sed -i Gruntfile.js -e 's/port: port,/port: port, hostname: "",/'
ADD index.html /revealjs/
ADD custom.css /revealjs/css/
ONBUILD ADD slides.md /revealjs/md/

EXPOSE 8000
VOLUME ["/revealjs/md/"]
CMD ["grunt", "serve"]