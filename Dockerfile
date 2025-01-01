FROM ubuntu:24.04

# Setup environment
RUN apt update
RUN apt install -y git make gcc

# Download Ozmoo
RUN git clone https://github.com/johanberntsson/ozmoo.git ~/ozmoo
RUN cd ~/ozmoo && chmod +x ./make.rb

# Install dependencies
RUN apt install -y ruby acme vice
RUN git clone https://bitbucket.org/magli143/exomizer.git ~/ozmoo/exomizer
RUN cd ~/ozmoo/exomizer/src && make


WORKDIR /data
ENTRYPOINT [ "ruby", "/root/ozmoo/make.rb" ]
