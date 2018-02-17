#!/usr/bin/env bash

# check for stow
type stow >/dev/null 2>&1 || { echo >&2 "First install GNU stow!"; }

# link the files
stow --target=$HOME home
