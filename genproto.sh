#!/bin/bash

export PATH="$PATH:$(go env GOPATH)/bin"

protoc --go_out=./bchrpc/go --go_opt=paths=source_relative --go-grpc_out=./bchrpc/go --go-grpc_opt=paths=source_relative ./bchrpc.proto


protoc -I=./bchrpc/js ./bchrpc.proto --proto_path=./ --js_out=import_style=commonjs,binary:./bchrpc/js \
  --grpc-web_out=import_style=typescript,mode=grpcwebtext:./bchrpc/js