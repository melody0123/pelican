#!/bin/bash

set -eux

ORIGIN=0
while "$1"; do
	case "$1" in
		origin)
		  nohup pelican-server origin serve --config /etc/pelican/origin.yaml > origin.log &
		  ORIGIN=1
		  shift
		  ;;
		cache)
		  if [ "$ORIGIN" -ne 1 ]; then
			  echo "You must start origin first before starting cache." >&2
			  exit 1
		  fi
		  nohup pelican-server cache serve --config /etc/pelican/cache.yaml > cache.log &
		  shift
		  ;;
		*)
		  echo "Unrecogized argument $1. Only accept origin or cache." >&2
		  exit 1
		  ;;
	esac
done
