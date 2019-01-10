#!/bin/bash

# Print help
usage="Usage: $(basename $0) [OPTIONS] [FILE]
  -h, --help    print this screen"

# Parse otpions
params="$(getopt -o h -l help --name $(basename $0) -- "$@")"

if [ $? -ne 0 ]
then
    echo "$usage"
    exit 1
fi

eval set -- "$params"
unset params

while true
do
    case $1 in
        -h|--help)
            echo "$usage"
            exit
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "$usage"
            exit 1
            ;;
    esac
done

# Remove color codes
sed -r "s/\x1b\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g" $1
