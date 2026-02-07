FROM nginx:stable

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf

COPY . /usr/share/nginx/html

RUN groupadd -r nginxgroup && useradd -r -g nginxgroup -s /sbin/nologin nginxuser

RUN chown -R nginxuser:nginxgroup /usr/share/nginx/html /var/cache/nginx /var/run /etc/nginx

ENTRYPOINT []

USER nginxuser

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]