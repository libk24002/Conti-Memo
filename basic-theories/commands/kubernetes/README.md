## Kubernetes Commands

### Port forwarding 
* ```shell
  # kubectl -n application port-forward --address 0.0.0.0 conti-pod 8080:80 # local:pod
  # kubectl -n application port-forward --address 0.0.0.0 svc/conti-svc 8080:80 # local:pod
  ```

### Force delete pod
* ```shell
  kubectl -n application delete pod podname --force --grace-period=0
  ## grace-period表示过渡存活期，默认30s, 0表示立即终止POD
  ```

### Patch
* ```shell
  kubectl patch -n application svc my-redis-cluster \ 
      -p '{"spec":{"ports":[{"name":"tcp-redis","nodePort":"new image"}]}}'
  ```

### Pod sa POD内部获取sa token信息
* ```shell
  # 通过将认证令牌直接发送到 API 服务器，也可以避免运行 kubectl proxy 命令。 内部的证书机制能够为链接提供保护
  
  ## 指向内部 API 服务器的主机名
  APISERVER=https://kubernetes.default.svc
  ## 服务账号令牌的路径
  SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
  ## 读取 Pod 的名字空间
  NAMESPACE=$(cat ${SERVICEACCOUNT}/namespace)
  ## 读取服务账号的持有者令牌
  TOKEN=$(cat ${SERVICEACCOUNT}/token)
  ## 引用内部证书机构（CA）
  CACERT=${SERVICEACCOUNT}/ca.crt
  ## 使用令牌访问 API
  curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api
  ```

### Update certs
* ```shell
  kubeadm alpha certs renew all
  docker ps | grep -v pause | grep -E "etcd|scheduler|controller|apiserver" | awk '{print $1}' | awk '{print "docker","restart",$1}' | bash
  cp /etc/kubernetes/admin.conf ~/.kube/config
  ```

### Taint
* NoSchedule ：表示k8s将不会将Pod调度到具有该污点的Node上
* PreferNoSchedule ：表示k8s将尽量避免将Pod调度到具有该污点的Node上
* NoExecute ：表示k8s将不会将Pod调度到具有该污点的Node上，同时会将Node上已经存在的Pod驱逐出去
* 设置污点
    + ```shell
      kubectl taint nodes k8s-node2 check=yuanzhang:NoExecute
      ```
* 查到污点
    + ```shell
      kubectl describe nodes k8s-node2
      ```
* 去除污点
    + ```shell
      kubectl taint nodes k8s-node2 check:NoExecute-
      ```