# Amazon Inspector

## Project Overview

This project focuses on mastering AWS Identity and Access Management (IAM) by provisioning and managing IAM resources. IAM is a critical AWS service for securely managing access to AWS services and resources. By implementing this project, the understanding of how to create and manage IAM users, groups, roles, and policies programmatically will be enhanced.

## Technologies Used

- **IAM:** Identity and Access Management for defining roles and permissions.
- **Terraform:** Infrastructure as Code (IaC) tool for automating resource provisioning.
- **Git:** For version control.

## Key Terms

- **IAM Users:** Individual accounts for accessing AWS services.
- **IAM Groups:** Collections of users with shared permissions.
- **IAM Roles:** Temporary credentials for users, applications, or services.
- **IAM Policies:** JSON documents defining access permissions.

## Key Concepts

**IAM Users:**

- Individual AWS accounts with access credentials (access key and secret key) for both programmatic access and management console login.
- Users are assigned to **groups**, or they may have **direct policies** attached to control their permissions.
- Users can also assume roles for temporary access to resources.

**IAM Groups:**

- Logical collections of IAM users that simplify permissions management.
- Permissions assigned to a group are inherited by all members, eliminating the need to attach policies directly to each user.
- A user can belong to **multiple groups**, inheriting permissions from all the groups they are a part of.

**IAM Roles:**

- AWS entities used to delegate permissions to **AWS services**, **external identities**, or even other **AWS accounts**.
- Roles are not tied to a specific user and do not have long-term credentials.
- Users can assume **multiple roles** to temporarily gain permissions they don’t usually have, but only one role can be assumed at a time per session.
- Example: A developer with restricted access may assume an admin role to perform privileged tasks temporarily.

**IAM Policies:**

- JSON-based documents that explicitly allow or deny actions on AWS resources.
- Policies define permissions in terms of **actions**, **resources**, and **conditions**.
- Can be attached to:
  - **Users** (directly).
  - **Groups** (applied to all members).
  - **Roles** (applied when the role is assumed).

## Requirements

- Terraform v1.5+
- AWS CLI
- AWS credentials configured.

## Usage

1. Clone this repository.

### Terraform

1. Edit `terraform.tfvars` with the desired AWS region and other variables.
2. Comment out either the `inspector-classic` or `inspector-v2` module in root's `main.tf` based on the desired version of Inspector.
3. Initialise Terraform:

   ```bash
   terraform init
4. terraform validate:

    ```bash
    terraform validate
    ```

5. Plan and apply the configuration:

    ```bash
    terraform plan
    terraform apply
    ```

## Testing

## Cleanup

### Terraform

1. Destroy resources

    ```bash
    terraform destroy
    ```

### CloudFormation

## Screenshots

###
