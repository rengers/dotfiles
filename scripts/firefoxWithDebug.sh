#!/usr/bin/env bash

#
# Run Firefox with WebRTC debugging.
# - Signaling (SDP) logs go to SIGNALING_FILE.
# - ICE/STUN/TURN logs go to stderr.
#

FIREFOX_EXEC=/Applications/Firefox.app/Contents/MacOS/firefox
SIGNALING_FILE=/tmp/firefox_signaling.log

set -e

# Signaling logs (SDP):
export NSPR_LOG_FILE=$SIGNALING_FILE
export NSPR_LOG_MODULES=signaling:5,mtransport:5,timestamp:1  # signaling and mtransport: 1-9
# ICE/STUN/TURN logs:
export R_LOG_LEVEL=9
export R_LOG_DESTINATION=stderr
export R_LOG_VERBOSE=1  # include the module name generating the message

$FIREFOX_EXEC
