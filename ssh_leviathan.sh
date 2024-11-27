#!/bin/bash
level=$1

while getopts ":p:f" opt; do
    case $opt in
    p)
        password=$OPTARG
        ;;
    f)
        force=true
        ;;
    \?)
        echo "Usage: $0 level [-p password] [-f]"
        exit 1
        ;;
    esac
done

# get level from positional argument
if [ -z "$level" ]; then
    echo "Usage: $0 level [-p password] [-f]"
    exit 1
fi

# check if password for leviathan exists if no password is provided
if [ -z "$password" ]; then
    if ! pass "leviathan/$level" >/dev/null 2>&1; then
        echo "Password for leviathan$level not found in pass. Use -p to provide password."
        exit 1
    fi
fi

# if password is set, check for existing password
if [ -n "$password" ]; then
    if pass "leviathan/$level" >/dev/null 2>&1; then
        if [ -z "$force" ]; then
            echo "Password for leviathan$level already exists in pass. Use -f to force overwrite."
            exit 1
        fi
    fi
    echo "$password" | pass insert -m "leviathan/$level"
fi

# ssh to leviathan
sshpass -p "$(pass leviathan/"$level")" ssh "leviathan$level@leviathan.labs.overthewire.org" -p 2223
