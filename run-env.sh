#!/bin/bash
echo "Starting environment..."
services=$(docker compose config --services)
echo "Configuring loadbalancer..."
upstreams=""
for service in $services; do
	upstreams="$upstreams \n server  $service:5000;"
done
cp nginx-lb.conf nginx.conf
sed -i -e "s/REPLACE_ME/$upstreams/" nginx.conf
echo "Starting docker containers..."
docker compose up --build -d

rm -fv nginx.conf

