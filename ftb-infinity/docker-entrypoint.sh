#!/bin/bash
set -e

cp -r --no-clobber /tmp/FTBInfinityEvolvedServer/* /data
. ./settings.sh

exec ${JAVACMD} $@