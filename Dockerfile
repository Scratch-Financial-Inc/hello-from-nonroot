FROM golang:1.9.3-alpine AS builder

RUN addgroup -S group && adduser -S nonroot -G group
USER nonroot

COPY /*.go /
RUN go build -o /hello-from /*.go

FROM alpine:3.7
COPY --from=builder /hello-from /
ENTRYPOINT ["/hello-from"]
