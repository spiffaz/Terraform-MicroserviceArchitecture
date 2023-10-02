# Microservices Architecture with AWS ECS and Consul

This project demonstrates a robust microservices architecture deployed on Amazon ECS (Elastic Container Service) and orchestrated using HashiCorp Consul. The architecture allows for easy scalability, high availability, and secure communication between microservices. Key technologies and AWS services used include ECS, EC2, VPC, CloudWatch, Secrets Manager, IAM, Route 53, and TLS certificates for secure communication.

## Tools and Technologies Used

### Amazon Web Services (AWS)
- **Amazon ECS:** Orchestrates Docker containers, ensuring efficient resource utilization and high availability.
- **Amazon EC2:** Provides scalable computing capacity for hosting Consul servers and databases.
- **Amazon VPC:** Creates a logically isolated section in AWS for deploying resources securely.
- **Amazon CloudWatch:** Monitors and collects operational data, providing insights into performance and security.
- **Amazon CloudWatch Logs:** Centralized log management for microservices, aiding in debugging and troubleshooting.
- **Amazon Route 53:** Scalable DNS service for reliable routing of end-user requests.
- **AWS Secrets Manager:** Securely stores and manages sensitive information like database passwords and Consul tokens.
- **Amazon IAM:** Manages access to AWS services and resources, ensuring security and compliance.

### HashiCorp Consul
- **Consul:** Service mesh solution facilitating secure communication between microservices, service discovery, and health checking.

### TLS Certificates
- **CA Certificate (consul-agent-ca.pem):** Validates the authenticity of other certificates, ensuring their validity.
- **Server Certificate (consul-server-cert.pem):** Authenticates Consul servers to clients and other servers.
- **Server Private Key (consul-server-key.pem):** Enables secure communication between Consul servers and clients.

## Benefits of the Architecture

- **Scalability:** Microservices can be easily scaled up or down based on demand, ensuring optimal resource utilization.
- **High Availability:** Amazon ECS and Consul enable the deployment of services across multiple availability zones, ensuring high availability and fault tolerance.
- **Security:** TLS certificates and Secrets Manager ensure secure communication channels and password management, respectively.
- **Monitoring and Logging:** Amazon CloudWatch provides monitoring and log management, aiding in performance optimization and issue resolution.
- **Service Discovery:** Consul's service discovery capabilities enable dynamic service registration and discovery, simplifying communication between microservices.
- **Flexibility:** Docker containers and ECS allow for flexible deployment, enabling the use of various programming languages and technologies within microservices.
- **Cost-Effectiveness:** ECS optimizes resource usage, allowing for cost-effective scaling and operation of microservices.

## Example Usage

### Prerequisites
1. **AWS Account:** Ensure you have an AWS account with appropriate permissions to create ECS clusters, EC2 instances, IAM roles, and other necessary resources.
2. **Terraform and Terraform Cloud:** Install Terraform on your local machine and set up a Terraform Cloud account. You can download Terraform from [terraform.io](https://www.terraform.io/).

### Steps to Use
1. **Clone the Repository:**
    ```bash
    git clone https://github.com/spiffaz/Terraform-MicroserviceArchitecture.git
    cd <repository-folder>
    ```

2. **Configure Terraform Cloud:**
    - Set up a Terraform Cloud workspace and configure the necessary environment variables for authentication.

3. **Update Terraform Variables:**
    - Update the default values in the `variables.tf` or better still, configure the `teraform.tfvars` file with your specific configuration values, such as region, VPC settings, and service details.

4. **Initialize Terraform:**
    ```bash
    terraform init
    ```

5. **Apply Terraform Configuration:**
    ```bash
    terraform apply
    ```
   This command will prompt you to confirm the changes before applying. Enter `yes` to proceed.

6. **Deploy Microservices:**
   - Once Terraform completes the setup, navigate to the ECS console in the AWS Management Console.
   - Find the ECS services created by Terraform, such as client, fruits, and vegetables.
   - Configure the desired number of tasks, launch type, and networking settings for each service.

7. **Access Microservices:**
   - After deployment, you can access the microservices using the Load Balancer DNS or IP provided by AWS.
   - Test the communication between microservices and verify the service discovery and load balancing functionalities implemented by Consul.

8. **Monitor and Troubleshoot:**
   - Use Amazon CloudWatch to monitor the performance of microservices.
   - Inspect CloudWatch logs for troubleshooting and debugging purposes.

9. **Cleanup:**
   - When you're done testing, ensure to destroy the resources to avoid incurring charges:
    ```bash
    terraform destroy
    ```
   Enter `yes` to confirm the deletion of resources.

## Additional Information

For more detailed deployment instructions and configuration options, refer to the Terraform scripts and shell scripts provided in this repository. Feel free to explore and modify the configuration to suit your specific use case. 

Happy coding! 🚀
