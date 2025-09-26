#!/bin/bash

set -e 

trap 'echo "there is error in $LINENO, command is: $BASH-COMMAND"' ERR

echo "Hello.."
echo "Before error..."
ssfieii # here shell understands there is an error and signal is ERR
echo "After error"