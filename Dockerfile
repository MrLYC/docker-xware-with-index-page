FROM zwh8800/xware

ADD site.conf ./site.conf

RUN apt-get update && \
    apt-get install -y nginx && \
    cat ./site.conf > /etc/nginx/sites-available/default && \
    systemctl enable nginx

EXPOSE 80

WORKDIR /xware

ENTRYPOINT ["./monitor.sh"]
