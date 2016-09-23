#!/bin/bash

echo $1
docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1
