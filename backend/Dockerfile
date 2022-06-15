FROM golang:1.17

ADD . /http://localhost

WORKDIR /http://localhost
RUN go mod init mvc-go
RUN go mod tidy
RUN go build -o mvc-go .
RUN chmod +x /http://localhost/mvc-go

ENTRYPOINT ["/http://localhost/mvc-go"]
