#!/bin/bash
set -eu

sudo chown -R coder:coder /home/coder

/usr/local/bin/code-server --user-data-dir /home/coder/vscode_data --install-extension vscodevim.vim
/usr/local/bin/code-server --user-data-dir /home/coder/vscode_data --install-extension james-yu.latex-workshop

cp -nr /etc/vscode_data/. /home/coder/vscode_data/

bash /usr/local/bin/workshop_fix.sh

dumb-init /usr/local/bin/code-server --user-data-dir /home/coder/vscode_data "$@"
