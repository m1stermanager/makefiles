OUTPUT=app.build

all: run

run: build
	./app.build

test: build
	go test $(go list ./... | grep -v vendor) -cover

build: dependencies
	go build -o $(OUTPUT)

dependencies:
	dep ensure
