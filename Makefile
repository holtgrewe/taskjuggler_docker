.PHONY: all build run

all: build

Dockerfile: Dockerfile.in
	cp $< $@
	perl -p -i -e "s/__GID__/$$(id -g)/g" $@
	perl -p -i -e "s/__UID__/$$(id -u)/g" $@

build: Dockerfile
	sudo docker build -t holtgrewe/taskjuggler .

run:
	sudo docker run holtgrewe/taskjuggler \
	    -v ${PWD}:/data \
	    -w /data
