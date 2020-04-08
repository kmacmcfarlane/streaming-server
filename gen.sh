#!/bin/bash

mkdir -p ./gen
for template in ./template/*.tmpl ./template/.*.tmpl
do
    outFile=`echo $template|sed -e "s/.tmpl//"|sed -e "s/.\/template\///"`
    echo building $outFile from $template
    ./bin/template_tool --template $template --config ./config.json --out ./gen/$outFile

    if [[ $? -ne 0 ]]
    then
        exit $?
    fi
done
