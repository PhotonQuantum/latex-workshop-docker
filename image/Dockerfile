FROM texlive/texlive:latest

RUN apt update -y && apt upgrade -y

RUN apt install -y latexmk chktex

RUN apt install -y curl sudo dumb-init

RUN curl -fL https://github.com/cdr/code-server/releases/download/v3.9.0/code-server-3.9.0-linux-amd64.tar.gz \
 | tar -C /usr/local/lib -xz
# COPY package.tar.gz package.tar.gz
# RUN cat package.tar.gz \
#   | tar -C /usr/local/lib -xz

RUN mv /usr/local/lib/code-server-3.9.0-linux-amd64 /usr/local/lib/code-server-3.9.0 && \
ln -s /usr/local/lib/code-server-3.9.0/bin/code-server /usr/local/bin/code-server

RUN adduser --gecos '' --disabled-password coder && \
  echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

RUN mkdir -p /home/coder/.config/code-server/data

COPY vscode_data/ /etc/vscode_data

COPY workshop_fix.sh /usr/local/bin/workshop_fix.sh

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh && chown coder:coder /home/coder/ -R

EXPOSE 8000

USER 1000:1000

ENV USER=coder

WORKDIR /home/coder

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]
