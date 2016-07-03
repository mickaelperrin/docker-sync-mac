#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Retrieve original files in container"
sleep 2
docker exec -it test_nginx_1 bash -c 'find /usr/share/nginx/html/ -type f | xargs touch'

echo "Unzip dinhy-master.zip in container"
sleep 2
docker exec -it test_nginx_1 unzip /usr/share/nginx/html/dinghy-master.zip -d /usr/share/nginx/html

sleep 5

echo "Number of files remotely: $(docker exec -t test_nginx_1 find /usr/share/nginx/html -type f | wc -l)"
echo "Number of files locally: $(find ${DIR}/src -type f | wc -l)"

sleep 15

echo "Removing unzipped files locally"
sleep 2
rm -rfv ${DIR}/src/dinghy-master

sleep 10

echo "Number of files remotely: $(docker exec -t test_nginx_1 find /usr/share/nginx/html -type f | wc -l)"
echo "Number of files locally: $(find ${DIR}/src -type f | wc -l)"

sleep 5

echo "Unzip dinhy-master.zip locally"
sleep 2
unzip ${DIR}/src/dinghy-master.zip -d ${DIR}/src

sleep 5

echo "Number of files remotely: $(docker exec -t test_nginx_1 find /usr/share/nginx/html -type f | wc -l)"
echo "Number of files locally: $(find ${DIR}/src -type f | wc -l)"

sleep 5

echo "Remove unzipped files in container"
sleep 2
docker exec -it test_nginx_1 rm -rf /usr/share/nginx/html/dinghy-master

sleep 5

echo "Number of files remotely: $(docker exec -t test_nginx_1 find /usr/share/nginx/html -type f | wc -l)"
echo "Number of files locally: $(find ${DIR}/src -type f | wc -l)"