#!/bin/bash

docker-compose down --v
sudo rm -Rf ./data/.* 2> /dev/null || true
sudo rm -Rf ./data/* || true