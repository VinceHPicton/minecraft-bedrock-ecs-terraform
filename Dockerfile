FROM ubuntu:latest

RUN apt update
RUN apt install -y unzip curl
RUN mkdir -p /home/ubuntu/aws
WORKDIR /home/ubuntu/aws

RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip  -o awscliv2.zip
RUN unzip awscliv2.zip
RUN ./aws/install

WORKDIR /home/ubuntu/minecraft
COPY bedrock-server-1.21.73.01.zip /home/ubuntu/minecraft

RUN unzip bedrock-server-1.21.73.01.zip
RUN rm bedrock-server-1.21.73.01.zip

ENTRYPOINT ["LD_LIBRARY_PATH=. ./bedrock_server"]