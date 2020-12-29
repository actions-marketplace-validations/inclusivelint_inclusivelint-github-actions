FROM debian:jessie

RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y wget && \
    curl -sL https://deb.nodesource.com/setup_15.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y nodejs-legacy && \
    apt-get install -y npm && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    npm install -g inclusivelint

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]