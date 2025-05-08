# jenkins

## main usage

* none

## conceptions

* none

## purpose
* none

## pre-requirements
* [create local cluster for testing](../create.local.cluster.with.kind.md)
* [ingress](../basic%20components/ingress.nginx.md)
* [cert-manager](../basic%20components/cert.manager.md)

## Do it

1. prepare [jenkins.values.yaml](resources/jenkins.values.yaml.md)
2. prepare images
    * ```shell  
      DOCKER_IMAGE_PATH=/root/docker-images && mkdir -p ${DOCKER_IMAGE_PATH}
      BASE_URL="https://resource.cnconti.cc/docker-images"
      LOCAL_IMAGE="localhost:5000"
      for IMAGE in "docker.io/bitnami/jenkins:2.319.3-debian-10-r7" \
          "docker.io/bitnami/bitnami-shell:10-debian-10-r341" \
          "docker.io/bitnami/jenkins-exporter:0.20171225.0-debian-10-r705"
      do
          IMAGE_FILE=$(echo ${IMAGE} | sed "s/\//_/g" | sed "s/\:/_/g").dim
          LOCAL_IMAGE_FIEL=${DOCKER_IMAGE_PATH}/${IMAGE_FILE}
          if [ ! -f ${LOCAL_IMAGE_FIEL} ]; then
              curl -o ${IMAGE_FILE} -L ${BASE_URL}/${IMAGE_FILE} \
                  && mv ${IMAGE_FILE} ${LOCAL_IMAGE_FIEL} \
                  || rm -rf ${IMAGE_FILE}
          fi
          docker image load -i ${LOCAL_IMAGE_FIEL} && rm -rf ${LOCAL_IMAGE_FIEL}
          docker image inspect ${IMAGE} || docker pull ${IMAGE}
          docker image tag ${IMAGE} ${LOCAL_IMAGE}/${IMAGE}
          docker push ${LOCAL_IMAGE}/${IMAGE}
      done
      ```
3. install by helm
    * ```shell
      helm install \
          --create-namespace --namespace application \
          my-jenkins \
          https://resource.cnconti.cc/charts/jenkins-9.0.0.tgz \
          --values jenkins.values.yaml \
          --atomic
      ```

## test
1. check connection
    * ```shell
      curl --insecure --header 'Host: npm.local.com' https://localhost
      ```
2. visit gitea via website
    * visit `https://npm.local.com`
    * ```shell
      kubectl -n application get secret gitea-admin-secret -o jsonpath="{.data.username}" | base64 --decode && echo
      kubectl -n application get secret gitea-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo
      ```
      
## uninstall 
* ```shell
  helm -n application uninstall  my-jenkins
  ```



















