
FROM alpine:3.21

WORKDIR /app
COPY ./glance .
COPY ./config ./config
COPY ./assets ./assets

EXPOSE 8080/tcp
ENTRYPOINT ["/app/glance", "--config", "/app/config/glance.yml"]