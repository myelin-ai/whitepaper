#!/usr/bin/env bash

set -e +x /bin/bash

scp main.pdf "$WHITEPAPER_SCP_UPLOAD_TARGET/whitepaper.pdf"
