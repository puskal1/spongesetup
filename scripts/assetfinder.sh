#!/bin/bash

assetfinder -subs-only $1 | sed 's/\*\.//g' | sort -u

