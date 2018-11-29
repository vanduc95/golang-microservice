FROM ubuntu:16.04
MAINTAINER ducnv95

COPY Golang-Microservice /app/Golang-Microservice
RUN chmod +x /app/Golang-Microservice

ENV PORT 8000
EXPOSE 8000

ENTRYPOINT /app/Golang-Microservice
