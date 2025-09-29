## mirror-apt

### Content
1. 启动一个镜像，用于相关镜像同步工作
    * prepare [sync-ubuntu-22.04.sh](sync-ubuntu-22.04.sh)
    * ```shell
      docker run --rm --init \
          --name mirrors-apt-ubuntu-22.04 \
          -v $PWD/sync-ubuntu-22.04.sh:/app/entrypoint.sh:ro \
          -v $PWD/mirrors:/data:rw \
          --entrypoint /app/entrypoint.sh \
          -d m.lab.zverse.space/docker.io/library/debian:bullseye
      ```

m.lab.zverse.space/docker.io/library/ubuntu:22.04


* Using Podman to run an nginx container to provide APT image services
使用 podman 运行一个 nginx 容器来提供 APT 镜像服务：

podman run \
--name mirrors-apt \
-p 30000:80 \
-v /opt/mirrors/apt/data:/usr/share/nginx/html \
-v /opt/mirrors/apt/nginx.conf:/etc/nginx/nginx.conf:ro \
docker.io/library/nginx:1.23.4-bullseye

同步 Ubuntu 软件包数据（以清华大学镜像站为例）：

# 同步软件包元数据
rsync -avz --delete rsync://mirrors.tuna.tsinghua.edu.cn/ubuntu/dists/jammy /app/ubuntu/dists/

# 同步主要软件包
rsync -avz --delete rsync://mirrors.tuna.tsinghua.edu.cn/ubuntu/pool/main /app/ubuntu/pool/main/



#!/bin/bash

# Base directories
DIST_BASE="/app/ubuntu/dists"
POOL_BASE="/app/ubuntu/pool"

# Mirrors
MIRROR="rsync://mirrors.tuna.tsinghua.edu.cn/ubuntu"

# Sync dists
for DIST in jammy jammy-backports jammy-proposed jammy-security jammy-updates; do
echo ">>> Syncing dists: $DIST ..."
rsync -avz --delete ${MIRROR}/${DIST} ${DIST_BASE}
done

# Sync pools
for SECTION in main restricted universe multiverse; do
echo ">>> Syncing pool: $SECTION ..."
rsync -avz --delete ${MIRROR}/${SECTION} ${POOL_BASE}
done

echo ">>> Ubuntu 22.04 mirror sync finished!"
