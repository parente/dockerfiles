FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install stunnel supervisor wget
RUN install -d -o stunnel4 -g stunnel4 /var/run/stunnel4
RUN mkdir /irc

# patch ircit to set world-writable perms on all fifos and dirs it creates
RUN apt-get -y install make gcc
RUN cd /tmp && \
    wget http://dl.suckless.org/tools/ii-1.7.tar.gz && \
    tar xzf ii-1.7.tar.gz && \
    cd ii-1.7 && \
    sed -i ii.c -e 's/S_IRWXU/S_IRWXU\|S_IRWXG|S_IRWXO/g' && \
    make install && \
    rm -rf /tmp/*
RUN apt-get -y autoremove make gcc

# make an explicit ircit user and set the umask so that anyone 
RUN addgroup --gid 2000 ircit && \
    adduser --uid 2000 -gid 2000 --gecos "" --disabled-login --no-create-home ircit 
#RUN echo "umask 0000" >> /home/ircit/.profile

ADD ii.conf /etc/supervisor/conf.d/
ADD configure /configure

VOLUME ["/irc"]
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]