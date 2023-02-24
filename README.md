# ITI-Final-Project-Infrastructure :memo:
:white_check_mark: This repository is designed to deploy a secure infrastructure on `Google Cloud Platform (GCP)` using `Terraform`. The infrastructure includes:
- Virtual Private Cloud (VPC) with two subnets 
    - NAT gateway
    - Management Subnet & Restricted Subnet. 
- The Management Subnet contains:
    - Private VM 
- The Restricted Subnet contains:
    - `Private standard GKE cluster (private control plan)`.
    
:white_check_mark: This repository also include all kubernetes manifests to deploy `Jenkins and its slaves` on our GKE cluster.

## Prerequisites
- Linux system
- Terraform

## Getting Started
- To use this project, you will need to clone the repository to your local machine using the following command:
    
      git clone https://github.com/El-Zedy/Final-Project-Infrastructure
- Then starting by creating infrastructure using terraform

      cd Terraform-files
      terraform init
      terraform plan
      terrafrom apply
      
- Now ssh to private vm from your local

      gcloud compute ssh --zone "<zone_name>" "<privatevm_name>"  --tunnel-through-iap --project "<project_id>"
      
- prepare private vm to work with GKE
      
      sudo apt-get update
      sudo apt-get install kubectl  
      sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
      gcloud container clusters get-credentials <privatecluster_name> --zone <zone_name> --project <project_id>
   
- Create kubernetes manifests files for Jenkins
      
        kubectl create ns devops-tools
      
    - create serviceaccount, pristance volume, pristance volume claim, deployment and loadblancer service - yml files.

        *hint: you can find all manifests files at `kubernetes manifests/Jenkins-files` directory*
        
             kubectl create -f <serviceaccount_filename> 
             kubectl create -f <volume_filename> 
             kubectl create -f <deployment_filename> 
             kubectl create -f <service_filename>
             kubecttl get all -n devops-tools
             
     - get service external-ip to access jenkins from browser

             Hit `EXTERNAL_IP:8080` on your browser
     
     - git jenkins password
            
            kubectl exec -it <jenkins-pod> -n devops-tools -- cat /var/jenkins_home/secrets/initialAdminPassword

      
- Deploy jenkins slave
    
    - build our slave image from Dockerfile at `kubernetes manifests/Jenkins-files/Jenkins-slave`
        
            docker build -t moelzedy/jenkins-slave-finalv.
            
    - push slave image to dockerhub

            docker push moelzedy/jenkins-slave-finalv 

    - create deployment and service - yml files to our slave
    
        *hint: you can find all manifests files at `kubernetes manifests/Jenkins-files/Jenkins-slave` directory*
        
            kubectl create -f <deployment_filename> 
            kubectl create -f <service_filename> 
            
- Prepare our slave node
        
        kubectl exec -it <jenkins-agent> -n devops-tools -- bash
        passwd jenkins
        service ssh start
        chmod 666 /var/run/docker.socket
        apt-get install gettext-base
        su jenkins
        gcloud container clusters get-credentials <privatecluster_name> --zone <zone_name> --project <project_id>

            
- Add and configure slave node from jenkins ui
    
  *hint:* Go to `screenshots` dirctory to double check and make sure that everything going right during your steps.

- And now at this point we have our infrastructure up and running with jenkins and its slaves as deployment on our GKE cluster :tada::tada:
      
# What's next?
      
 create our jenkins pipline to dockerize deploy our our app to public users
            
            keep in touch with this repository: https://github.com/El-Zedy/Final-Project-App

## Contributing

Contributions to this project are welcome and appreciated. To contribute, please follow these steps:

1. Fork the repository to your own account.
2. Create a new branch for your changes.
3. Make your changes and commit them to your branch.
4. Create a pull request to merge your changes into the main branch.

## Acknowledgements
We would like to acknowledge the following individuals and resources for their contributions to this project:

- Our instructors, for providing guidance and support throughout the project.
- The Google Cloud Platform documentation, which served as a valuable resource for understanding the various GCP services and how they can be used together.
- The Terraform,Jenkins and Kubernetes documentation, which provided helpful guidance on building our resources.
- We would also like to thank our classmates and peers for their feedback and contributions to this project.

## Contact
If you have any questions or suggestions regarding this project, please contact the project owner at muhammadhassanelzedy@gmail.com .
      
      
