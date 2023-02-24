# ITI-Final-Project-Infrastructure
:white_check_mark: This repository is designed to deploy a secure infrastructure on `Google Cloud Platform (GCP)` using `Terraform`. The infrastructure includes:
- Virtual Private Cloud (VPC) with two subnets 
    - NAT gateway
    - Management Subnet & Restricted Subnet. 
- The Management Subnet contains:
    - Private VM 
- The Restricted Subnet contains:
    - `Private standard GKE cluster (private control plan)`.
    
:white_check_mark: This repository also include all kubernetes manifests to deply `Jenkins and its slaves` on our GKE cluster.

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
      
      - create serviceaccount, pristance volume, pristance volume claim, deployment and loadblancer service.

      - hint: you can find all manifests files at `kubernetes manifests` directory
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
