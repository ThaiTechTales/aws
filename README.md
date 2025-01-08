# AWS Projects Repository

## Purpose

This repository serves as a centralised hub for all AWS-related projects. The aim is to explore and implement various AWS services and solutions, showcasing practical knowledge of cloud architecture, infrastructure management, and automation.

## Intention

- To consolidate AWS projects that demonstrate skills in Infrastructure as Code (IaC), cloud-native application development, and cost-efficient cloud solutions.
- To create a portfolio of projects that highlight proficiency in AWS certifications and tools.

## Projects

- **ec2-webapp:** This project showcases the creation of a highly available web application infrastructure on AWS using Terraform, featuring a VPC, multi-AZ subnets, an EC2 instance with a web server, and an Application Load Balancer.
- **lambda-logging:** This project demonstrates automated AWS infrastructure deployment using Terraform modules, including centralised logging, an S3-triggered Lambda function, and IaC provisioning for all required resources.

## Source Control Strategy

To ensure consistency, scalability, and maintainability across all projects, the following source control strategy will be followed. Branching is organised using the structure:

```bash
<project-name>/<branch-type>/<specific-task>
```

### Branching Overview

**main/**

- Represents production-ready code. This branch contains projects that have been built, tested, and are ready for deployment. All completed work is eventually merged into main.

**<project-name>/dev**

- The default branch for active development within a project. It should always remain stable enough for integration testing and serves as the base branch for feature branches.

**<project-name>/feature/<specific-task>**

- For new features or enhancements. These branches are created from `dev`, worked on, and merged back into dev upon completion.
  - Example: project-a/feature/infra-setup

**<project-name>/bugfix/<specific-task>**

- For fixing bugs identified during development or testing. These branches are created from dev and merged back into dev after the issue is resolved.

  - Example: project-b/bugfix/fix-logic-error

**<project-name>/hotfix/<specific-task>**

- For urgent fixes to production issues. These branches are created directly from main, then merged back into both main and dev.

  - Example: project-c/hotfix/security-patch

**<project-name>/release/<version>**

- For preparing a project for release. These branches allow for final tweaks, minor fixes, and version tagging. Once ready, they are merged into main and tagged with the release version.

  - Example: project-a/release/v1.0.0

**<project-name>/chore/<specific-task>**

- For minor tasks that are not feature-related, such as updating dependencies, improving documentation, or cleaning up code.

  - Example: project-c/chore/update-gitignore

### Branching Examples

```bash
aws/
├── project-a/
│   ├── dev                         # Main development branch for Project A
│   ├── feature/
│   │   ├── add-infra               # Adding infrastructure setup
│   │   ├── add-routing             # Adding routing configurations
│   ├── bugfix/
│   │   └── fix-cidr-mismatch       # Fix CIDR block mismatch issue
│   ├── hotfix/
│   │   └── sg-rule-error           # Urgent fix for security group rules
│   ├── release/
│   │   └── v1.0.0                  # Release preparation branch
│   └── chore/
│       └── update-docs             # Update README or other documentation
├── project-b/
│   ├── dev                         # Main development branch for Project B
│   ├── feature/
│   │   ├── enable-lifecycle-rules  # Adding lifecycle rules
│   │   └── add-versioning          # Enabling versioning
│   ├── bugfix/
│   │   └── fix-policy              # Fix incorrect policy
│   ├── hotfix/
│   │   └── access-issue            # Fix urgent access issues
│   └── chore/
│       └── clean-unused-resources  # Maintenance task to clean unused resources
├── project-c/
│   ├── dev                         # Main development branch for Project C
│   ├── feature/
│   │   ├── add-dynamodb-trigger    # Adding trigger for DynamoDB
│   │   └── optimize-memory-usage   # Optimizing memory usage
│   ├── bugfix/
│   │   └── fix-timeout-error       # Fix timeout issue
│   ├── hotfix/
│   │   └── iam-policy-fix          # Urgent IAM policy correction
│   └── chore/
│       └── update-dependencies     # Update dependencies
├── main                            # Central production-ready branch

```

### Commit Message Guidelines

Writing clear and professional commit messages is crucial for maintaining an understandable project history.

#### Structure of a Commit Message

Each commit message should consist of two parts:

**Title:**

- A concise, imperative sentence summarising the change.
- Imperative Tone: Always write the title in imperative mood as if commanding an action (e.g., "add", "fix", "remove", "update").
- To maintain consistency, use prefixes to indicate the purpose of the commit:

    | Prefix    | Use Case                                            |  Example                                          |
    | ----------| ----------------------------------------------------| --------------------------------------------------|
    | feat      | For new features or enhancements                    | `feat: add lifecycle rules for S3`                |
    | fix       | For bug fixes                                       | `fix: resolve timeout error in Lambda`            |
    | docs      | For documentation updates                           | `docs: update README with usage details`          |
    | style     |For code formatting (non-functional changes)         | `style: format main.tf with terraform fmt`        |
    | refactor  | For code refactoring (no functionality change)      | `refactor: optimise loop logic in script`         |
    | test      | For adding or updating tests                        | `test: add unit tests for DynamoDB triggers`      |
    | chore     | For minor tasks (e.g., dependency updates)          | `chore: update dependencies in requirements.txt`  |

- Example:

    ```bash
    feat: add lifecycle rules to s3 bucket`
    ```

**Description (optional, but highly recommended):**

- A more detailed explanation of what was changed, why it was changed, and any relevant technical details.
- Use bullet points for readability if there are multiple points.
- Be Descriptive:
  - Explain what was done and why.
- Example:

    ```bash
    - Implemented lifecycle rules to automatically transition objects to Glacier after 30 days.
    - Added Terraform configurations for S3 lifecycle policy management.
    - This feature helps optimise storage costs for infrequently accessed data.
    ```
