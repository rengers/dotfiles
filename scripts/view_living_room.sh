#!/usr/bin/env zsh

# Retrieve the password securely and store it in an environment variable
CAM_PASSWORD=$(op read "op://Personal/Reolink/password")

# Retrieve the camera ip securely and store it in an environment variable
CAM_IP=$(op read "op://Personal/Reolink/ip_address")

ffplay -fflags nobuffer -max_delay 500000 -probesize 32 -analyzeduration 0 -fast -flags low_delay -vf setpts=0 -strict experimental -framedrop -rtsp_transport udp -i rtsp://admin:$CAM_PASSWORD@$CAM_IP/h264Preview_01_main -window_title "Livingroom Camera Feed" 2>&1 | sed 's/admin:[^\/]*@/admin:****@/g'  | tee /dev/tty
