FROM golang:1.27 AS builder

WORKDIR /app

COPY . .

RUN go build main.go

FROM alpine:latest AS runner

WORKDIR /app

COPY --from=builder /app/main.exe .

CMD ["./main.exe"]
