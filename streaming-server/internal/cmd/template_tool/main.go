package main

import (
    "encoding/json"
    "flag"
    "fmt"
    "github.com/kmacmcfarlane/streaming-server/streaming-server/internal/config"
    "github.com/xeipuuv/gojsonschema"
    "io/ioutil"
    "os"
    "strings"
    "text/template"
)

func main() {

    tmplPath := flag.String("template", "", "path to nginx.conf.tmpl")
    outPath := flag.String("out", "", "path to output nginx.conf")
    confPath := flag.String("config", "", "path to config.json")
    schemaPath := flag.String("schema", "", "path to config.schema.json")

    flag.Parse()

    if tmplPath == nil {

        flag.PrintDefaults()

        _, _ = fmt.Fprintf(os.Stderr, "path to template is required")
        os.Exit(1)
    }

    tmplBytes, err := ioutil.ReadFile(*tmplPath)

    if err != nil {
        _, _ = fmt.Fprintf(os.Stderr, "could not read template (%s): %v", *tmplPath, err)
        os.Exit(2)
    }

    tmpl, err := template.New("server config").Parse(string(tmplBytes))
    if err != nil {
        _, _ = fmt.Fprintf(os.Stderr, "could not parse template (%s): %v", *tmplPath, err)
        os.Exit(3)
    }

    if confPath == nil {

        flag.PrintDefaults()

        _, _ = fmt.Fprintf(os.Stderr, "path to config.json is required")
        os.Exit(4)
    }

    confBytes, err := ioutil.ReadFile(*confPath)

    if err != nil {
        _, _ = fmt.Fprintf(os.Stderr, "could not open config file (%s): %v", *confPath, err)
        os.Exit(5)
    }


    if schemaPath == nil {

        flag.PrintDefaults()

        _, _ = fmt.Fprintf(os.Stderr, "path to config.schema.json is required")
        os.Exit(4)
    }
    
    schemaURLPath := strings.Join([]string{"file://", *schemaPath}, "")
    schemaLoader := gojsonschema.NewReferenceLoader(schemaURLPath)

    confURLPath := strings.Join([]string{"file://", *confPath}, "")
    documentLoader := gojsonschema.NewReferenceLoader(confURLPath)

    result, err := gojsonschema.Validate(schemaLoader, documentLoader)

    if err != nil {
        _, _ = fmt.Fprintf(os.Stderr, "could not load the config.schema.json validation file: %v", err)
        os.Exit(6)
    }

    if !result.Valid() {
        _, _ = fmt.Fprintf(os.Stderr, "config.json is not valid: %v", result.Errors())
        os.Exit(7)
    }

    if outPath == nil {
        flag.PrintDefaults()
        _, _ = fmt.Fprintf(os.Stderr, "output file is required")
        os.Exit(8)
    }

    var serverConf config.Configuration
    err = json.Unmarshal(confBytes, &serverConf)
    if err != nil {
        _, _ = fmt.Fprintf(os.Stderr, "could not parse server config (%s): %v", *confPath, err)
        os.Exit(9)
    }

    outFile, err := os.Create(*outPath)
    if err != nil {
        _, _ = fmt.Fprintf(os.Stderr, "could not open output file (%s): %v", *outPath, err)
        os.Exit(10)
    }
    defer outFile.Close()

    err = tmpl.Execute(outFile, serverConf)
    if err != nil {
        _, _ = fmt.Fprintf(os.Stderr, "error executing template (%s) with config (%s): %v", *tmplPath, *confPath, err)
        os.Exit(11)
    }
}
