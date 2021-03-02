#!/bin/bash
set -eu

sudo chown -R coder:coder /home/coder

/usr/local/bin/code-server --user-data-dir /home/coder/vscode_data --install-extension vscodevim.vim

/usr/local/bin/code-server --user-data-dir /home/coder/vscode_data --install-extension /usr/local/share/latex-workshop.vsix

cp -nr /etc/vscode_data/. /home/coder/vscode_data/

dumb-init /usr/local/bin/code-server --user-data-dir /home/coder/vscode_data --proxy-domain "$DOMAIN" "$@"
