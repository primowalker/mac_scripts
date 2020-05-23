#!/usr/bin/env bash


function usage {
    echo
    echo -e "Usage: parse_App_Infra_Data <input_file output_file>"
    echo
    echo "Example - parse_App_Infra_Data App_Infra_Data_at_Server_Level.csv FDC_Master_Server_List.csv"
    exit
}

if [ -n "$1" ]; then
    var="$1"
else
        usage
fi

if [ -n "$2" ]; then
        var="$2"
else
    usage
fi

infile=$1
outfile=$2

cat ${infile} | sed 's/,,,,,,,,,,,//g' | awk -F, '{print $1 "," $2 "," $3 "," $5 "," $10 "," $11 "," $21 "," $23 "," $9}' | tr '[:upper:]' '[:lower:]' > ${outfile}