FROM pypy:2-2.5.0 
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org> 
COPY . /var/app/ 
COPY unicorecmsgemrwanda/static/ /var/app/ 
WORKDIR /var/app/ 
RUN pip install -e . 
EXPOSE 8080