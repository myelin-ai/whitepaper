#!/usr/bin/env bash

find . -type f -name '*.tex' | xargs -L1 ./scripts/spellcheck_file.sh
