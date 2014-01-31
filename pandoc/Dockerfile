FROM stackbrew/ubuntu:13.10

MAINTAINER Peter Parente <parente@cs.unc.edu>

# generic OS update
RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list
RUN apt-get update

# install pandoc
RUN sudo apt-get -y install pandoc

# mount point
RUN mkdir -p /host
WORKDIR /host

# show how we built it
ADD Dockerfile /

ENTRYPOINT ["pandoc"]
