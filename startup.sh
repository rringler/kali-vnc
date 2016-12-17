#!/bin/sh

# Start XServer
vncserver :1 &

# Create index.html for VNC server
ln -s /root/noVNC/vnc_auto.html /root/noVNC/index.html

# Start noVNC server
/root/noVNC/utils/launch.sh --vnc localhost:5901 &

# Exit to a shell
/bin/bash
