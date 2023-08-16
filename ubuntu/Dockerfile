FROM ubuntu:22.04

RUN apt update && \
  apt install -y git gdb \
  sudo

ARG USER=user
ARG PASSWD=pass
RUN useradd -m -s /bin/bash -G sudo -p ${PASSWD} ${USER}
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /app

ENTRYPOINT ["/bin/bash","-i","-c","\"$@\"","--"]
