FROM node:6-stretch
LABEL maintainer="jackhammer@olacabs.com"

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 3000

WORKDIR /home/app
ADD app/ /home/app

RUN apt update && \
    apt upgrade -yq && \
    apt install -yq --no-install-recommends \
        build-essential \
        figlet \
        libssl1.0-dev \
        maven \
        mysql-client \
        nmap \
        openjdk-8-jre \
        python-pip \
        ruby2.3 \
        ruby2.3-dev \
        software-properties-common \
        sqlite3 && \
    apt clean
RUN pip install -I GitPython==2.1.1
RUN npm install \
        nsp \
        phantomjs-prebuilt \
        retire
RUN gem install bundler -v 1.17 && \
    bundle install

# Always use https URLs for github repos
RUN git config --global url."https://github.com".insteadOf git://github.com

CMD ["puma", "-e", "production", "-b", "tcp://0.0.0.0:3000"]
ENTRYPOINT ["/home/app/entrypoint.sh"]