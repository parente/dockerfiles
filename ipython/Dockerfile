FROM ubuntu:14.04

MAINTAINER Peter Parente <parente@cs.unc.edu>

ENV HOME /root

RUN apt-get update
RUN apt-get -yq install pandoc python supervisor wget python-pip
RUN apt-get -yq install python-dev
RUN pip install pip --upgrade

RUN pip install ipython[notebook]==2.2

ADD notebook.conf /etc/supervisor/conf.d/notebook.conf
ADD start.sh /

RUN ipython profile create
RUN echo "c.FileNotebookManager.notebook_dir = u'/ipy'" >> /root/.ipython/profile_default/ipython_notebook_config.py

RUN mkdir /ipy
VOLUME ["/ipy"]

EXPOSE 8888
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]