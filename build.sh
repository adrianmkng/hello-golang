echo -n "Building app binary..."
env GOOS=linux GOARCH=amd64 go build .
echo "DONE"

echo -n "Building docker image..."
docker build -t localhost:5000/hello-golang:1.0 .
echo "DONE"
