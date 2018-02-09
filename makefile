BINARY=./app.o
VENDOR_DEST=vendor/

all: run

.PHONY: run
run: $(BINARY)
	$(BINARY)

.PHONY: test
test:
	go test $(go list ./... | grep -v vendor) -cover

$(BINARY): $(VENDOR_DEST)
	go build -o $(BINARY)

$(VENDOR_DEST):
	dep ensure

.PHONY: clean
clean:
	rm -f $(BINARY)

.PHONY: vendor_clean
vendor_clean:
	rm -rf $(VENDOR_DEST)
