FROM alpine:3.8
MAINTAINER Yusuf Iqbal <yusuf.iqbal@devfactory.com>

RUN apk --update add --no-cache \
        python \
        py-pip \
    && pip install --upgrade awscli \
    && apk -v --purge del py-pip \
    && rm /var/cache/apk/*

# Set the application directory
WORKDIR /app

# Copy code from the current folder to /app inside the container
ADD . /app

ENTRYPOINT [ "aws" ]