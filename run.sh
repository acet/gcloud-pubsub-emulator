#!/bin/sh

# Start the PubSub client in the background. It will poll for an open PubSub
# emulator port and create its topics and subscriptions when it's up.
#
# After it's done, port 8682 will be open to facilitate the wait-for and
# wait-for-it scripts.
(/usr/bin/wait-for localhost:8681 -- env PUBSUB_EMULATOR_HOST=localhost:8681 /usr/bin/pubsubc -debug; nc -lkp 8682 >/dev/null) &

# Start the PubSub emulator in the foreground.
#gcloud beta emulators pubsub start --host-port=0.0.0.0:8681 --log-http --verbosity=debug --user-output-enabled

java -Djava.util.logging.config.file="/logging.properties" -jar /google-cloud-sdk/platform/pubsub-emulator/lib/cloud-pubsub-emulator-0.1-SNAPSHOT-all.jar --host=0.0.0.0 --port=8681 --log-http --verbosity=debug --user-output-enabled
