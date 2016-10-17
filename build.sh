#!/bin/bash

docker build --pull --tag cups $@ $(dirname $0)

