#!/bin/bash
# Nagios script to check stats on transmission tracker
# Requires PHP torrent tracker interface

PHPTRACKERHOME=/var/www/tracker

PEERCOUNT=`transmission-remote -t $(transmission-remote -l| tail -n +2 | grep -v "^Sum\:" | grep ubuntu | awk '{ print $1; }' | tr -cd '[[:digit:]]') -pi | tail -n +2 |wc -l`

SEEDCOUNT=`php ${PHPTRACKERHOME}/getseedcount.php`
LEECHCOUNT=`php ${PHPTRACKERHOME}/getleechcount.php`

echo -n OK\ - ${HOSTNAME}: peercount ${PEERCOUNT}, leechcount ${LEECHCOUNT}, seedcount ${SEEDCOUNT}\|peercount=${PEERCOUNT}\;leechcount=${LEECHCOUNT}\;seedcount=${SEEDCOUNT}

exit 0
