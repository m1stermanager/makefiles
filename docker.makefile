IMAGE_NAME=makefile_test
APP_LOCATION=$(shell go list)
BINARY=./app.o
VENDOR_DEST=vendor
GO_VERSION=1.9
ALPINE_VERSION=3.7

all: run

.PHONY: run
run: $(BINARY)
	docker run \
	-v $(PWD):/go \
	-w /go \
	alpine:$(ALPINE_VERSION) $(BINARY)

$(BINARY): $(VENDOR_DEST)
	docker run \
	-v $(PWD):/go/src/$(APP_LOCATION) \
	-w /go/src/$(APP_LOCATION) \
	golang:$(GO_VERSION)-alpine$(ALPINE_VERSION) \
	go build -o $(BINARY)

$(VENDOR_DEST):
	docker run \
	-v  $(PWD):/go/src/$(APP_LOCATION) \
	-w /go/src/$(APP_LOCATION) \
	supinf/go-dep ensure

.PHONY: clean
clean:
	rm -f $(BINARY)

.PHONY: vendor_clean
vendor_clean:
	rm -rf $(VENDOR_DEST)
