FROM kalilinux/kali-rolling
MAINTAINER Ryan Ringler <rringler@gmail.com>

# Add Xwindows configuration
ADD .vnc /root/.vnc
ADD .Xauthority /root/.Xauthority

# Copy startup script
ADD startup.sh /startup.sh

# Configure user for Xwindows
ENV USER root

# Run startup script
RUN apt-get update && \
    apt-get install -y git python tightvncserver x11vnc xfce4 && \
    git clone https://github.com/novnc/noVNC.git /root/noVNC && \
    git clone https://github.com/novnc/websockify.git /root/noVNC/utils/websockify && \
    chmod 0755 /startup.sh && \
    ./startup.sh

# Expose VNC & websockify ports
EXPOSE 5901 6080
