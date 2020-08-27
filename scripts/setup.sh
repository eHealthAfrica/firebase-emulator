#!/bin/bash

docker-compose -f docker-compose.yml -f docker-compose.setup.yml run --rm emulator setup_all
