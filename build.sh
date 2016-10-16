#!/bin/bash

docker build --rm=false --pull --tag cups $@ $(dirname $0)

