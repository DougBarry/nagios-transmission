#!/bin/bash
# Nagios script to check peer count on transmission tracker

PEERCOUNT=`transmission-remote -t $(transmission-remote -l| tail -n +2 | grep -v "^Sum\:" | grep ubuntu | awk '{ print $1; }' | tr -cd '[[:digit:]]') -pi | tail -n +2 |wc -l`

echo -n OK\ - ${HOSTNAME}: peercount ${PEERCOUNT}\|peercount=${PEERCOUNT}

exit 0
