#!/usr/bin/env bash

set -e

source_file='main.pdf'
bot_user='myelin-bot'
target_repository="https://$bot_user:$DEPLOY_GITHUB_TOKEN@github.com/myelin-ai/whitepaper.myelin.ch.git"
temp_directory=$(mktemp -d)
target_file="$temp_directory/whitepaper.pdf"

git clone --quiet --depth=1 \
    "$target_repository" "$temp_directory"

cp "$source_file" "$target_file"

git -C "$temp_directory" \
    commit --allow-empty -m "Build for $GITHUB_SHA"

git -C "$temp_directory" \
    push