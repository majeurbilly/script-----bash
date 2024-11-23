#!/bin/bash
for (( i = 0; i < 15; i++ )); do
    bash ./GameTravel.sh $((100 + "$RANDOM" % 1000))
done

