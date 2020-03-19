FROM golang:1.10.2 as builder

COPY pkg/ ./pkg/
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o demo-controller .

FROM alpine:3.7  

COPY --from=builder demo-controller .
CMD ["/demo-controller"] 