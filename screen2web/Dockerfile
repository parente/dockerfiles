FROM debian:wheezy
RUN apt-get update
RUN apt-get install -y ffmpeg ffmpeg2theora
RUN mkdir -p /target
ADD convert.sh /
WORKDIR /target
ENTRYPOINT ["/convert.sh"]