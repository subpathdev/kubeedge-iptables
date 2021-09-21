FROM golang:alpine3.14 as build

COPY . /app
RUN go build -o /usr/local/bin/kubeedgeIpTablesManager cmd/iptables/main.go

FROM alpine:3.14

RUN apk --no-cache add iptables

COPY --form=build /usr/local/bin/kubeedgeIpTablesManager /usr/local/bin/kubeedgeIpTablesManager

ENTRYPOINT ["kubeedgeIpTablesManager"]