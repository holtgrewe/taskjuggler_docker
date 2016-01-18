FROM ubuntu:14.04

# Add user and group
RUN groupadd group -g 5000 && \
    useradd -u 5005 -g group user

RUN apt-get install -y \
        software-properties-common

RUN add-apt-repository ppa:brightbox/ruby-ng && \
    apt-get update -y && \
    apt-get install -y ruby2.1

RUN gem install taskjuggler

USER user
