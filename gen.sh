#!/bin/bash

mkdir -p ./gen

if [[ ! -f "./config.json" ]]; then
    cp ./config.example.json ./config.json
fi

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
