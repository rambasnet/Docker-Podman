FROM kalilinux/kali-rolling

RUN apt update \
  && apt install -y \
  build-essential ccache libboost-all-dev \
  gcc-multilib g++-multilib \
  python3 python3-pip \
  gdb gdb-multiarch gdbserver\
  libsqlite3-dev \
  time curl cmake git nano dos2unix \
  net-tools iputils-ping iproute2 \
  man-db host dnsutils netcat-traditional \
  nmap traceroute sudo

RUN pip3 install --upgrade pip

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

WORKDIR /app

RUN echo export PATH='"'/app/bin:/app/bin/$(uname -s)-$(uname -m):/app:'${PATH}''"' >> /root/.bashrc

ENTRYPOINT ["/bin/bash","-i","-c","\"$@\"","--"]
