#!/bin/sh -e

secret=/run/secrets/tangdata

cd /
while sleep 5; do

  ls -l /db || true

  tar zxvf $secret && exec start-servers
  clevis decrypt < $secret | tar zxv && exec start-servers

  echo Waiting for data
done


