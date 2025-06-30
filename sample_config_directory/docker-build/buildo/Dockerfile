FROM ubuntu:24.04

COPY  --chmod=0755 ./bin /bin/

RUN apt update && \
  apt upgrade -y &&  \
  apt install -y wget && \
  wget https://siakhooi.github.io/apt/siakhooi-apt.list -O /etc/apt/sources.list.d/siakhooi-apt.list && \
  wget https://siakhooi.github.io/apt/siakhooi-apt.gpg  -O /usr/share/keyrings/siakhooi-apt.gpg && \
  apt -y update && \
  apt -y install siakhooi-buildo && \
  rm -rf /var/lib/apt/lists/*

WORKDIR "/working"
CMD ["/bin/bash"]
