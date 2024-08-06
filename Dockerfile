# Base image.
FROM golang:1.22.5-alpine

# Set evironment variables.
ENV LANG=C.UTF-8

# Set up working directory.
WORKDIR /app

# Intall Air.
RUN go install github.com/air-verse/air@latest

# Copy Go files.
COPY ./src/go.* .

# Download packages.
RUN go mod download

# Copy source files.
COPY ./src .

#RUN go build -o main main.go

# Document port.
EXPOSE 9000

#CMD ["./main"]
CMD ["air", "-c", ".air.toml"]