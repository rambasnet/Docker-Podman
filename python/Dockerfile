FROM python:3

RUN apt update \
  && apt install -y \
  sqlite3 build-essential time curl cmake git nano dos2unix \
  net-tools iputils-ping iproute2 \
  && apt clean \
  && /bin/rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app

RUN echo export PATH='"'/app/bin:/app/bin/$(uname -s)-$(uname -m):/app:'${PATH}''"' >> /root/.bashrc

ENTRYPOINT ["/bin/bash","-i","-c","\"$@\"","--"]
