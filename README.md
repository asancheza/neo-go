# neo-go

NSQ producer and consumer implemented in Go. This project provides a simple setup to work with NSQ, a real-time distributed messaging platform, using Go language.

## Features

- **Producer:** Sends messages to an NSQ topic.
- **Consumer:** Receives messages from an NSQ topic and processes them.

## Requirements

- Go Programming Language
- Docker

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/asancheza/neo-go.git
   cd neo-go
   ```

2. **Install Go dependencies:**
   ```bash
   make install-dependencies
   ```

## Usage

### Running NSQ

To start NSQ with the necessary services using Docker, you can run the following:

```bash
make nsq
```

This command will:

- Pull the NSQ Docker image.
- Start `nsqlookupd` for service discovery.
- Start `nsqd`, the daemon that handles messaging.

### Running the Producer

To send messages to an NSQ topic, you can run the producer:

```bash
make producer
```

The producer is configured to connect to the `nsqd` instance and publish messages.

### Running the Consumer

While the `Makefile` includes commands for the producer and setting up NSQ, ensure to also configure and run your consumer to connect to the `nsqd` instance and process messages.

## License

This project is licensed under the GPL-3.0 License.

## Author

Developed by [Alejandro Acosta](https://github.com/asancheza).

For further information, inquiries, or contributions, feel free to reach out to the author via GitHub.