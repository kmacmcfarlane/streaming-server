package main

import (
    "github.com/kmacmcfarlane/streaming-server/internal/config"
    "flag"
    "fmt"
    "io/ioutil"
    "encoding/json"
    "log"
    "os"
    "text/template"
)

func main() {

    tmplPath := flag.String("template", "", "path to nginx.conf.tmpl")
    outPath := flag.String("out", "", "path to output nginx.conf")
    confPath := flag.String("config", "", "path to config.json")

    flag.Parse()

    if tmplPath == nil {
        flag.PrintDefaults()
	log.Fatal("path to template is required")
    }

    if confPath == nil {
        flag.PrintDefaults()
        log.Fatal("path to config.json is required")
    }

    if outPath == nil {
        flag.PrintDefaults()
        log.Fatal("output file is required")
    }

    tmplBytes, err := ioutil.ReadFile(*tmplPath)

    if err != nil {
        log.Fatal(fmt.Errorf("could not read template (%s): %v", *tmplPath, err))
    }

    tmpl, err := template.New("server config").Parse(string(tmplBytes))
    if err != nil {
        log.Fatal(fmt.Errorf("could not parse template (%s): %v", *tmplPath, err))
    }

    confBytes, err := ioutil.ReadFile(*confPath)

    if err != nil {
        log.Fatal(fmt.Errorf("could not open config file (%s): %v", *confPath, err))
    }

    var serverConf config.Configuration
    err = json.Unmarshal(confBytes, &serverConf)
    if err != nil {
        log.Fatal(fmt.Errorf("could not parse server config (%s): %v", *confPath, err))
    }

    outFile, err := os.Create(*outPath)
    if err != nil {
        log.Fatal(fmt.Errorf("could not open output file (%s): %v", *outPath, err))
    }
    defer outFile.Close()

    err = tmpl.Execute(outFile, serverConf)
    if err != nil {
        log.Fatal(fmt.Errorf("error executing template (%s) with config (%s): %v", *tmplPath, *confPath, err))
    }
}
