FROM debian:bullseye-slim
USER root
RUN apt-get update 
RUN apt-get install -y python3 python3-pip git 
RUN useradd webapp
RUN mkdir /home/webapp
RUN chown -R webapp: /srv /home/webapp

USER webapp
RUN git clone https://github.com/babithg/puddle-web.git /srv

WORKDIR /srv/puddle-web
RUN pip install -r requirements.txt

CMD ["/usr/bin/python3", "manage.py", "run", "0.0.0.0:80"]
