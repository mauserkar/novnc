FROM debian:buster-slim

ENV VNC_SRV_IP=localhost
ENV VNC_SRV_PORT=5901

RUN apt-get update && \
    apt-get install -fy git procps python3 python3-pip

RUN apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN git clone https://github.com/novnc/noVNC.git

RUN python3 -m pip install numpy

RUN sed -i 's/localhost:5900/$VNC_SRV_IP:$VNC_SRV_PORT/g' /noVNC/utils/launch.sh

RUN cp /noVNC/vnc.html /noVNC/index.html

EXPOSE 6080

CMD ["/noVNC/utils/launch.sh"]