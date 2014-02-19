FROM ubuntu:13.10

MAINTAINER Peter Parente <parente@cs.unc.edu>

ENV HOME /root

RUN apt-get update
RUN apt-get -yq install pandoc python supervisor wget python-pip
RUN apt-get -yq install python-dev
RUN apt-get -yq install git
RUN pip install pip --upgrade

RUN pip install pyzmq==14.0.1
RUN pip install jinja2==2.7.2
RUN pip install tornado==3.2
RUN pip install markdown==2.3.1
RUN pip install pygments==1.6
RUN pip install git+https://github.com/ipython/ipython.git@a8dcf064dda56a7cd91929ea3d644010a6636047#egg=ipython

ADD notebook.conf /etc/supervisor/conf.d/notebook.conf
ADD start.sh /

RUN ipython profile create
RUN echo "c.FileNotebookManager.notebook_dir = u'/ipy'" >> /root/.ipython/profile_default/ipython_notebook_config.py

RUN mkdir /ipy
VOLUME ["/ipy"]

EXPOSE 8888
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]