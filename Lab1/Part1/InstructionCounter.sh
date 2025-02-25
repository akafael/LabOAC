#!/bin/bash                                                                                                           

MARS_MIPS="/opt/mars_mips/Mars45_Custom4.jar"

INDEX=0;
MAX_INDEX=19;

PROGRAM='sort2.s'

OUT="Index,IC"

while [ $INDEX -le $MAX_INDEX ]; do
    INSTRUCTION_COUNT=$(echo $INDEX |\
    java -jar $MARS_MIPS ic $PROGRAM|\
    tail -2);

    echo $INDEX,$INSTRUCTION_COUNT

    INDEX=$((INDEX + 1))
done
