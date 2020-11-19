#!/bin/bash

PROJECT=pj-becfr-bigdata-dev
BUCKET=ps2bq_tmp_folder
MAIN=com.google.cloud.teleport.templates.PubSubToBigQuery

echo "project=$PROJECT  bucket=$BUCKET  main=$MAIN"

export PATH=/usr/lib/jvm/java-8-openjdk-amd64/bin/:$PATH
mvn compile -e exec:java \
 -Dexec.mainClass=$MAIN \
      -Dexec.args="--project=$PROJECT \
      --stagingLocation=gs://$BUCKET/staging/ \
      --tempLocation=gs://$BUCKET/staging/ \
      --runner=DataflowRunner"
