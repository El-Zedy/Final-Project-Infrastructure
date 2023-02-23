#!/bin/bash
sudo apt-get update
sudo apt-get install kubectl
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
gcloud container clusters get-credentials privatecluster --zone us-central1-c --project moelzedy
kubectl get node
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

jenkins pass admin admin
kubectl get all -n devops-tools
kubectl exec -it jenkins-fd5fdf49f-74jzb -n devops-tools -- cat /var/jenkins_home/secrets/initialAdminPassword

kubectl exec -it jenkins-agent-db487b59d-75lfr -n devops-tools -- bash
/home/jenkins# apt-get install apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt-get update &&  apt-get install google-cloud-cli
apt-get install google-cloud-cli-app-engine-java
apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
chmod 666 /var/run/docker.sock
gcloud auth configure-docker
service ssh start
 passwd jenkins 123





sudo apt install ansible
gcloud compute scp sa_key.json mozoz@private-vm:/home/mozoz   
ssh-keygen -t rsa -f ~/.ssh/my_private_key
gcloud compute project-info add-metadata \
    --metadata-from-file ssh-keys=~/.ssh/my_private_key.pub
private_key_file = ~/.ssh/my_private_key
