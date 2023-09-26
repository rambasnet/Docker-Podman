FROM python:3

RUN apt update \
  && apt install -y \
  sqlite3 build-essential time curl cmake git nano dos2unix \
  net-tools iputils-ping iproute2 sudo

ARG USER=user
ARG UID=1001
ARG GID=1001

# Set environment variables
ENV USER                ${USER}
ENV HOME                /home/${USER}

# Create user and setup permissions on /etc/sudoers
RUN useradd -m -s /bin/bash -N -u $UID $USER && \
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers && \
    chmod 0440 /etc/sudoers && \
    chmod g+w /etc/passwd 

RUN pip install --upgrade pip

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app

RUN echo export PATH='"'/app/bin:/app/bin/$(uname -s)-$(uname -m):/app:'${PATH}''"' >> /root/.bashrc

VOLUME ${HOME}/.ssh
VOLUME ${HOME}/.gnupg
WORKDIR /repo
VOLUME /repo

USER user

CMD bash -i

ENTRYPOINT ["/bin/bash","-i","-c","\"$@\"","--"]
