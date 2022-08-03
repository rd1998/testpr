FROM ubuntu 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update 
RUN apt install –y apache2 
RUN echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
