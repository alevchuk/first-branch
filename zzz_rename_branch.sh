#!/bin/bash
# set -u
# set -e

# Documentation may have references to self may break unless
# we replace the text
# NOTE: this may break references to external repositories that still use the problematic term

exclude=".git|zzz_.*.sh"
find . -type f | grep -vE "$exclude" | xargs perl -pi -e 's/master/first/gi'
