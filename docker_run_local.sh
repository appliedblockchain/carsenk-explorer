image_name=appliedblockchain/fern-explorer-poc
container_name=block-explorer
containers=$(docker ps -aq --filter name=$container_name)

docker stop $containers || true
docker rm $containers || true
docker pull $image_name:latest

docker run -d --name $container_name \
  -e JSONRPC_HOST=localhost \
  -e JSONRPC_PORT=8545 \
  -e PORT=8000 \
  -p 8000:8000 \
  $image_name