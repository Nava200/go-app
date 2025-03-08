# Dockerfile
FROM golang:1.18-alpine as builder

WORKDIR /app
COPY . .
RUN go build -o go-app .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/go-app .

CMD ["./go-app"]
