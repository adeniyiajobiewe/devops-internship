# First stage
FROM golang:1.19-alpine3.16 AS BuildStage

WORKDIR /myGoApp

ADD . /myGoApp/

RUN CGO_ENABLED=0 GOOS=linux go build -o main .


# Second stage
FROM alpine:latest AS ProdStage

# WORKDIR /newimage/app

COPY --from=BuildStage /myGoApp .

EXPOSE 8080

CMD ["./main"]