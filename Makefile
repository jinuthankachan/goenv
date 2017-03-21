project = goenv
default: run
.PHONY : build run clean fmt setup

setup:
	glide up

fmt:
	go fmt $(project)/

build: fmt
	go install $(project)

run: build
	cd ../../bin && ./$(project)

clean:
	go clean
	glide cache-clear
