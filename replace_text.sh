#!/bin/bash
# set -u
# set -e

# Documentation may have references to self may break unless
# we replace the text
# NOTE: this may break references to external repositories that still use the problematic term

function prompt {
    read -p "$1 " -n 1 -r
    echo    # move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
}

exclude="\.git|replace_text\.sh"
find_cmd="find . -type f | grep -vE "'"'"$exclude"'"'
grep_cmd="sh -c "'"'"$find_cmd"'"'" | xargs grep master"

count="$($grep_cmd | wc -l)"

if [ "$count" -gt "0" ]; then
    if [ prompt "Found $count occureances of \"master\", would you like to see all the files and lines before we proceed to the next question?" ]; then
        $grep_cmd
    fi

    sh -c "'"'"$find_cmd"'"'" | xargs perl -pi -e 's/master/first/gi'
fi
