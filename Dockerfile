FROM debian:buster-slim

ENV VNC_SRV_IP=localhost
ENV VNC_SRV_PORT=5901

RUN apt-get update && \
    apt-get install -fy git procps python3 python3-pip

RUN apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN python3 -m pip install numpy

WORKDIR /app

RUN git clone https://github.com/novnc/noVNC.git /app/noVNC
RUN git clone https://github.com/kanaka/websockify /app/noVNC/utils/websockify

RUN sed -i 's/localhost:5900/$VNC_SRV_IP:$VNC_SRV_PORT/g' /app/noVNC/utils/launch.sh
RUN cp /app/noVNC/vnc.html /app/noVNC/index.html

EXPOSE 6080

CMD ["/utils/launch.sh"]