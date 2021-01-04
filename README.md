# novnc
container for noVNC client (https://github.com/novnc/noVNC)

# Running noVNC container

docker run -d --restart always \
    --name no-vnc-client \
    -e VNC_SRV_IP=localhost \
    -e VNC_SRV_PORT=5901  \
    -p 6080:6080 \
    carlosgaro/novnc:latest 
