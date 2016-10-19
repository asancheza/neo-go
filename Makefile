.DEFAULT_GOAL := provision

.PHONY: install-dependencies
install-dependencies: 
	@go get github.com/bitly/go-nsq

.PHONY: provision
provision: install-dependencies

.PHONY: producer
producer: nsq
	@go run producer/main.go

.PHONY: nsq
nsq:
	@docker pull nsqio/nsq
	@docker run --name lookupd -p 4160:4160 -p 4161:4161 nsqio/nsq /nsqlookupd &
	@docker run --name nsqd -p 4150:4150 -p 4151:4151 \
		    nsqio/nsq /nsqd \
			--broadcast-address=127.0.0.1 \
			--lookupd-tcp-address=127.0.0.1:4160 &

