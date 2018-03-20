FROM alpine:3.7

RUN mkdir /app
COPY hello-golang /app
EXPOSE 8080

ENTRYPOINT ["/app/hello-golang"]
