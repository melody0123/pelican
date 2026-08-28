#!/bin/bash

set -eux

nohup pelican-server director serve --config /etc/pelican/director.yaml > director.log &
sleep 3
nohup pelican-server registry serve --config /etc/pelican/registry.yaml > registry.log &
