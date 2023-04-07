# Altschool_third_semester-exam
This is a repository containing the solution to my third semester examination at altschool.
This repository contains some terraform script to automate the creation of a virtual private cloud (vpc), Eks cluster, worker nodes, and jenkins server to create a 
CI/CD pipeline to trigger the build process of the scripts and kubernetes manifest files to deploy a sock-shop application, votingapp, and promeheus-grafana.

## This Repository contains
- [x] Backend module which creates an S3 and dynamodb to initiate remote state and state-locking.
- [x] Eks_Network module which creates VPC, 3 Private subnet and three public subnet, nat gateway, internet gateway, and route tables.
- [x] Eks_Cluster module which creates the Eks cluster, and 3 worker-nodes
- [x] Jenkins_Server module which creates a vpc, internet gateway, public subnet, route table, security and groups and a t3.medium ec2 ubuntu ec2 instance and a shell script to install java and jenkins.
- [x] Logs module to create vpc log_flows and logs the information inside and s3 bucket.
- [x] Monitoring module to launch prometheus-grafana in a namespace inside a worker-node.
- [x] ingress module to create ingress rules for the cluster
- [x] nginx-controller module to create a stagnant loadblancer that routes internet traffic to various services within the worker-nodes in diffrent namespaces.
- [x] sock-shop folder containing the sock-shop application manifest file.
- [x] voting-app folder containing the voting application manifest file.
- [x] infrastructure-jenkinsfile containing jenkins build script for aws inftrastructure.
- [x] jenkinsfile containing jenkins build script for application deployment, ingress and nginx-controller.

## The output of the examination

<ol>
  <li> The output for Eks_Network, and Eks_Cluster module build success using jenkins
      <p>![alt text](https://github.com/ogunleye0720/Altschool_third_semester-exam/blob/master/build-success.JPG?raw=true height="20%" width="70%")
        <img src="https://github.com/ogunleye0720/Altschool_third_semester-exam/images/blob/master/build-success.JPG" height="10%" width="70%" /></p>
  </li>
</ol>
