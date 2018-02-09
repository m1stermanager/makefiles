OUTPUT=./app.o
VENDOR_DEST=vendor/

all: run

.PHONY: run
run: $(OUTPUT)
	$(OUTPUT)

.PHONY: test
test:
	go test $(go list ./... | grep -v vendor) -cover

$(OUTPUT): $(VENDOR_DEST)
	go build -o $(OUTPUT)

$(VENDOR_DEST):
	dep ensure

.PHONY: clean
clean:
	rm $(OUTPUT)

.PHONY: vendor_clean
vendor_clean:
	rm -r $(VENDOR_DEST)
