package main

import (
	"fmt"
	"log"
	"net/http"
)

func viewHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>%s</h1><div>%s</div>", "demo", "hello world")
}

func main() {
	http.HandleFunc("/hello", viewHandler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
