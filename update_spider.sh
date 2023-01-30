#!/bin/bash
echo "停止容器"
containerId=`(docker ps -a | awk '{ print $1}' | tail -n +2)`
echo $containerId
for str in $containerId
do
  docker stop $str
done
echo "删除容器"
containerId=`(docker ps -a | awk '{ print $1}' | tail -n +2)`
echo $containerId
for str in $containerId
do
  docker rm $str
done
echo "删除所有镜像"
containerId=`(docker images | awk "{ print $3 }" | tail -n +2)`
echo $containerId
for str in $containerId
do
  docker rmi $str
done
docker images

echo "FROM python:3.9.13
RUN apt-get update && apt-get install vim -y && apt-get install git -y
WORKDIR /work
RUN git clone --depth 1 https://code_commiter-at-358135713291:yjPPnVzmPyGWOW5HvkIycyELrwc2XN8cghHwLFFOHCY=@git-codecommit.us-west-1.amazonaws.com/v1/repos/twitter_spider
WORKDIR /work/twitter_spider/
RUN ls
RUN pip install -r  requirements.txt
CMD  python /work/twitter_spider/run.py --start && /bin/bash" > Dockerfile
echo "构建镜像"
docker build -t twitter_spider:v1 .
echo "启动容器"
docker run -m 500M --memory-swap=700M -itd --restart=always -e HOST_IP=$(hostname) -e SPIDER_TYPE=parse  --name parse_1 twitter_spider:v1
docker run -m 500M --memory-swap=700M -itd --restart=always -e HOST_IP=$(hostname) -e SPIDER_TYPE=spider  --name spider_1 twitter_spider:v1
