Name of Company: Farmers Market

Company Details: 

Application that sells fruits On-line via the cloud! FOC as in Fruits On Cloud.

Farmers Market Co. is a vibrant and community-oriented company that aims to connect local farmers, producers, and artisans with conscious consumers. Our mission is to provide a platform where people can access fresh, locally sourced, and sustainably grown products while supporting the local economy and foster a sense of community spirit.

This platform will provide a stage for farmers to showcase their products as well as for consumers to source the items.
- The business model can be either B2B or B2C.
- As fruits often go bad, its expected to be a fast moving platform.

The team comprise of:
- Wan Jun
- Lawrance
- Shaiful
- Omar

Deployment Strategy:
- Deploy on ECS 
- 1 Branch -> Main branch

# Capstone-Project---DevOps-CI-CD-Pipeline!

# Architecture Diagram
![Alt text](Capstone%20Project.drawio%20(1).png)

- If changes are made to Terraform, Terraform.yml will run automatically. It will format, validate and apply onto the AWS Platform. If changes are made to Terraform, main.yml will wait until Terraform provisioning is completed before starting. If no changes are made to Terraform, main.yml will run nevertheless. 
