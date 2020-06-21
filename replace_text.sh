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
        return 1
    fi

    return 0
}

exclude="\.git|replace_text\.sh"
find_cmd="find . -type f | grep -vE "'"'"$exclude"'"'

count="$(/bin/bash -c "$find_cmd" | xargs grep master | wc -l | xargs echo)"

if [ "$count" -gt "0" ]; then
    if prompt "Found $count occurrences of \"master\", would you like to see all the files and lines before we proceed to the next question?"; then
        /bin/bash -c "$find_cmd" | xargs grep --color=always master
        echo
        echo
    fi

    if prompt "Would you like to replace all occurrences of \"master\" with \"init\"?"; then
        /bin/bash -c "$find_cmd" | xargs perl -pi -e 's/master/init/gi'
    else
        if prompt "Would you like to get an interactive prompt for replacing each of the occurrences of \"master\" with \"init\"?"; then
            for file in `/bin/bash -c "$find_cmd"`; do
                grep -q --color=always master "$file"
                if [ $? -eq 0 ]; then
                    echo "#########################"
                    echo "Found occurrence(s) in $file"
                    echo "#########################"

                    grep --color=always master "$file"

                    if prompt "Replace?"; then
                        perl -pi -e 's/master/init/gi' "$file"
                        echo Done
                    fi
                fi
            done
        fi
    fi
else
    echo "No occurrences found"
fi
