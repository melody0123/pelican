#!/bin/bash

set -xeuo pipefail

# Copy pelican.yaml to /etc
cp *.yaml /etc/pelican/

# Create folders for origin and cache to hold objects
mkdir -p /srv/pfed/{export,cache,config}

# Install server binary
install -m 755 ../dist/pelican-server_linux_arm64*/pelican-server /usr/bin/pelican-server
