#!/bin/sh
RSYNC="rsync --archive --delete --delete-delay --delay-updates --links --hard-links --no-motd "
TOPDIR="/var/www/mirrors"

ALIENURL="rsync://rsync.slackware.org.uk/people"
SLACKURL="rsync://rsync.slackware.org.uk/slackware/"
#ALIENURL="rsync://taper.alienbase.nl/mirrors/people"
#SLACKURL="rsync://mirrors3.kernel.org/slackware"

echo "START"

echo "${ALIENURL}/alien"
$RSYNC ${ALIENURL}/alien $TOPDIR/people

echo "${ALIENURL}/alien-kde"
$RSYNC ${ALIENURL}/alien-kde $TOPDIR/people

echo "${SLACKURL}"
$RSYNC \
    --include "/slackware*-14.1" \
    --include "/slackware*-current" \
    --exclude '/*' \
${SLACKURL} $TOPDIR/slackware
