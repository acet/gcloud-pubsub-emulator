#!/usr/bin/env bash

set -e

sudo docker build -t acet/gcloud-pubsub-emulator:latest .
sudo docker push acet/gcloud-pubsub-emulator:latest

