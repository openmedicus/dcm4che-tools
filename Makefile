VERSION = 5.15.0

all: pull build tag push

pull:
	sudo docker pull openjdk:8-jre

build:
	cp Dockerfile.in Dockerfile
	sed -i -e 's!@VERSION@!${VERSION}!g' Dockerfile
	sudo docker build --no-cache -t dcm4che-tools .

tag:
	sudo docker tag dcm4che-tools openmedicus/dcm4che-tools:${VERSION}

push:
	sudo docker push openmedicus/dcm4che-tools:${VERSION}

run:
	sudo docker run -i -t dcm4che-tools /bin/bash
