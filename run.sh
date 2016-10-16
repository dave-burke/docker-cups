#!/bin/bash

name="cups"
cid="$(docker ps -q --filter "name=${name}")"
if [ -n "${cid}" ]; then
	echo "Stopping container..."
	docker stop "${name}" > /dev/null
fi
cid="$(docker ps -a -q --filter "name=${name}")"
if [ -n "${cid}" ]; then
	echo "Removing container..."
	docker rm "${name}" > /dev/null
fi

echo "Running container..."
#docker run --name ${name} --detach --restart=always --privileged -v /dev/bus/usb:/dev/bus/usb --publish 631:631 ${name}
docker run -it --rm --privileged -v /dev/bus/usb:/dev/bus/usb --publish 631:631 ${name} sh

