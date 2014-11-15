FROM ubuntu:14.04

MAINTAINER Peter Parente <pparent@us.ibm.com>

RUN apt-get update
RUN apt-get -yq install python python-pip python-dev
RUN pip install ipython[notebook]==2.2

ADD start.sh /

EXPOSE 8080
CMD ["/start.sh"]
