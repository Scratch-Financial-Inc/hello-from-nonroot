FROM golang:1.9.3-alpine AS builder

RUN groupadd -g 1001 nonroot
RUN useradd --no-create-home nonroot -s /bin/false -u 1001 -g nonroot
USER nonroot

COPY /*.go /
RUN go build -o /hello-from /*.go

FROM alpine:3.7
COPY --from=builder /hello-from /
ENTRYPOINT ["/hello-from"]
