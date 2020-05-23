#!/bin/bash
 
if [ -n "$1" ]; then
        var="$1"
    else
        echo
        echo "Usage: rmtabs <file>"
        echo
        echo "Example - rmtabs error.log"
        exit
fi

sed -i 's/\t\t*/ /g' > $1
 
 