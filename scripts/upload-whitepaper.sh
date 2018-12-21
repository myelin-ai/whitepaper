#!/usr/bin/env bash

set -e +x /bin/bash

scp whitepaper.json "$DOCS_SCP_UPLOAD_TARGET"
scp main.pdf "$DOCS_SCP_UPLOAD_TARGET/whitepaper.pdf"
