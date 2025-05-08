## redis-cluster

## main usage
* Provide Redis-cluster functionality for applications

## conceptions
* none

## purpose
* none

## precondition
* [create.local.cluster.with.kind](/basics/kubernetes/create.local.cluster.with.kind.md)
* [installed ingress-nginx](/basics/kubernetes/basic%20components/ingress.nginx.md)
* [installed cert-manager](/basics/kubernetes/basic%20components/cert.manager.md)

## do it
1. prepare images
    * ```shell
      DOCKER_IMAGE_PATH=/root/docker-images && mkdir -p $DOCKER_IMAGE_PATH
      BASE_URL="https://resource.cnconti.cc/docker-images"
      # BASE_URL="https://resource-ops.lab.zjvis.net:32443/docker-images"
      for IMAGE in "docker.io_bitnami_redis-cluster_6.2.2-debian-10-r0.dim" \
          "docker.io_bitnami_redis-exporter_1.20.0-debian-10-r27.dim" \
          "docker.io_bitnami_bitnami-shell_10.dim"
      do
          IMAGE_FILE=$DOCKER_IMAGE_PATH/$IMAGE
          if [ ! -f $IMAGE_FILE ]; then
              TMP_FILE=$IMAGE_FILE.tmp \
                  && curl -o "$TMP_FILE" -L "$BASE_URL/$IMAGE" \
                  && mv $TMP_FILE $IMAGE_FILE
          fi
          docker image load -i $IMAGE_FILE && rm -f $IMAGE_FILE
      done
      DOCKER_REGISTRY="localhost:5000"
      for IMAGE in "docker.io/bitnami/redis-cluster:6.2.2-debian-10-r0" \
          "docker.io/bitnami/redis-exporter:1.20.0-debian-10-r27" \
          "docker.io/bitnami/bitnami-shell:10"
      do
          DOCKER_TARGET_IMAGE=$DOCKER_REGISTRY/$IMAGE
          docker tag $IMAGE $DOCKER_TARGET_IMAGE \
              && docker push $DOCKER_TARGET_IMAGE \
              && docker image rm $DOCKER_TARGET_IMAGE
      done
      ```
2. prepare [redis-cluster.values.yaml](resources/redis-cluster.values.yaml.md)
3. install `redis-cluster`
    * NOTE: `https://resource-ops.lab.zjvis.net:32443/charts/charts.bitnami.com/bitnami/redis-cluster-5.0.1.tgz`
    * ```shell
      helm install \
          --create-namespace --namespace application \
          my-redis-cluster \
          https://resource.cnconti.cc/charts/charts.bitnami.com/bitnami/redis-cluster-5.0.1.tgz \
          --values redis-cluster.values.yaml \
          --atomic
      ```
4. install `redis-cluster-tool`
    * prepare [redis.cluster.tool.yaml](resources/redis.cluster.tool.yaml.md)
    * ```shell
      kubectl -n application apply -f redis.cluster.tool.yaml
      ```

## test
1. connect to `redis-cluster`
    * ```shell
      kubectl -n application exec -it deployment/redis-cluster-tool -- bash -c '\
          echo "ping" | redis-cli -c -h my-redis-cluster.application -a $REDIS_PASSWORD' \
      && kubectl -n application exec -it deployment/redis-cluster-tool -- bash -c '\
          echo "set mykey somevalue" | redis-cli -c -h my-redis-cluster.application -a $REDIS_PASSWORD' \
      && kubectl -n application exec -it deployment/redis-cluster-tool -- bash -c '\
          echo "get mykey" | redis-cli -c -h my-redis-cluster.application -a $REDIS_PASSWORD' \
      && kubectl -n application exec -it deployment/redis-cluster-tool -- bash -c '\
          echo "del mykey" | redis-cli -c -h my-redis-cluster.application -a $REDIS_PASSWORD' \
      && kubectl -n application exec -it deployment/redis-cluster-tool -- bash -c '\
          echo "get mykey" | redis-cli -c -h my-redis-cluster.application -a $REDIS_PASSWORD'
      ```

### uninstall
1. uninstall `my-redis-cluster`
    * ```shell
      helm -n application uninstall my-redis-cluster && \
      for INDEX in "0" "1" "2" "3" "4" "5"
      do
          kubectl -n application delete pvc redis-data-my-redis-cluster-${INDEX}
      done
      ```
2. delete `redis-cluster-tool`
    * ```shell
      kubectl -n application delete deployment redis-cluster-tool
      ```
