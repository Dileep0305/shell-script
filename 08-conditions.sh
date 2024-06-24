#!bin/bash

NUM=$1

if [ $NUM -gt 100 ]; then
    echo "Given number $NUM is grater than 100"
else
    echo "Given number $NUM is not greater than 100"
fi
