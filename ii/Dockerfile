FROM ubuntu:13.10

RUN apt-get update
RUN apt-get -y install ii stunnel supervisor
RUN install -d -o stunnel4 -g stunnel4 /var/run/stunnel4
RUN mkdir /irc
RUN chown -R nobody /irc

ADD ii.conf /etc/supervisor/conf.d/
ADD configure /configure

VOLUME ["/irc"]
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]