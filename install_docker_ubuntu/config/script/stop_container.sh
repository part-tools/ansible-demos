#!/bin/sh
green='\e[0;32m' # 绿色  
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # 没有颜色

container=""
if [ $# -ge 1 ]; then
    container=$1
else
	echo -e "\n\n${YELLOW}please input docker container!!! ${NC}"
	exit 0
fi

echo -e "\n\n${YELLOW}Stop docker container:$container ${NC}"


# 停止容器 
docker ps -a | grep -w $container
if [ $? == 0 ]; then
    echo -e "${YELLOW}======================start to stop container=================${NC}"
    docker stop $(docker ps -a | grep $container | awk '{print $1 }')
    # 删除容器
    docker rm $(docker ps -a | grep $container | awk '{print $1 }')
fi

echo -e "${GREEN}=======================list docker processes=====================${NC}"
docker ps -a

echo -e "\n\n"
