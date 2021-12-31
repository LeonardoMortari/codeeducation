FROM golang:alpine as builder

WORKDIR /go/src/app

COPY index.go /go/src/app

RUN CGO_ENABLED=0 go build -o /app index.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]
