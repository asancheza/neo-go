package main

import (
	"log"
	"sync"

	"github.com/bitly/go-nsq"
)

func main() {
	wg := &sync.WaitGroup{}
	wg.Add(1)

	config := nsq.NewConfig()
	q, _ := nsq.NewConsumer("write_test", "ch", config)
	q.AddHandler(nsq.HandlerFunc(func(message *nsq.Message) error { 
		log.Printf("Got a message: %v", message)
		wg.Done()
		return nil
	}))

	err := q.ConnectToNSQD("127.0.0.1:32769")
	if err != nil {
		log.Panic("Could not connect")
	}

	wg.Wait()
}

