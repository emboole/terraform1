# Index

- [Secure Data Migration with CloudFront Access - S3Migrator-CloudFront.yaml](#secure-data-migration-with-cloudfront-access---s3migrator-cloudfrontyaml)
- [Secure Data Migration - S3Migrator.yaml](#secure-data-migration---s3migratoryaml)
- [CloudFront Distribution Configuration for S3 Bucket - CloudFront-Enforcer.yaml](#cloudfront-distribution-configuration-for-s3-bucket---cloudfront-enforceryaml)
- [S3 Bucket Metrics Retrieval Script - BucketSize.py](#s3-bucket-metrics-retrieval-script---bucketsizepy)

---

# Secure Data Migration with CloudFront Access - S3Migrator-CloudFront.yaml

This CloudFormation template sets up a secure data migration process from a source S3 bucket to a destination bucket. It ensures exclusive access to the destination bucket via CloudFront and disables both public and static website hosting on the source bucket.

## Description

The template creates the necessary AWS resources to migrate data securely between two S3 buckets and ensures that the destination bucket is accessible only through a CloudFront distribution. This setup enhances the security and performance of serving content.

## Resources Created

- **Destination S3 Bucket**: A new S3 bucket for storing migrated data. If the bucket already exists, it will be used as the destination.
- **Lambda Execution Role**: An IAM role that grants the Lambda function permissions to access S3 resources.
- **Lambda Function**: A Python-based Lambda function that handles the migration of data from the source bucket to the destination bucket and applies security configurations to disable public access.
- **CloudFront Origin Access Control (OAC)**: Configures CloudFront to use Origin Access Protocol (OAP) for secure access to the S3 bucket.
- **S3 Bucket Policy**: A policy applied to the destination bucket that allows access only from the CloudFront distribution.
- **CloudFront Distribution**: A CloudFront distribution configured to serve content from the destination bucket with enhanced security and performance.

## Parameters

- **SourceBucketName**: The name of the source S3 bucket from which data will be migrated.
- **DestinationBucketName**: The name of the destination S3 bucket to which data will be migrated.

## Security

This template enhances the security of your data migration process and content delivery by:

- Disabling public access and static website hosting on the source bucket.
- Ensuring that the destination bucket is only accessible through a CloudFront distribution, leveraging AWS's global edge network for performance and security.

## Service Catalog Execution Steps

To execute the S3Migrator-CloudFront product via Service Catalog, follow these steps:

### Prerequisites

- You must have the necessary permissions in Service Catalog.
- You need access to the S3 and CloudFront services.

### Step 1: Accessing the Product

1. Sign in to the AWS Management Console.
2. Navigate to **Service Catalog**.
3. In the **Provisioning** section, select **Products**.
4. Find and select the product.
5. Press the **Launch product** button.

### Step 2: Product Configuration

1. Assign a name to your provisioned product for easy identification.
2. Proceed by clicking **NEXT**.

### Step 3: Enter Parameters

1. Enter the name of your source S3 bucket in **SourceBucketName**.
2. Enter the name for your destination S3 bucket in **DestinationBucketName**. The bucket will be created if it doesn't exist.

### Step 4: Review and Launch

1. Confirm all settings are correct.
2. Launch the product by clicking **LAUNCH PRODUCT**.

### Step 5: Monitor the Launch

1. Monitor the provisioning process in the Service Catalog console.
2. Await the status to change to **SUCCEEDED**.

### Step 6: Review Outputs (optional)

1. Upon successful provisioning, examine the **Outputs** tab for relevant details such as the Destination S3 Bucket Name and CloudFront Distribution URL.
2. Record the Lambda Function ARN and CloudFront Distribution ID for your records.

### Step 7: Post-Launch Verification

1. Verify the success of data migration to the destination S3 bucket.
2. Test the CloudFront distribution to confirm it is serving content properly.
3. Apply any additional configurations or security measures as needed.

## CloudFormation Execution Steps

This method offers an alternative to Service Catalog, providing direct deployment and management of resources.

### Prerequisites

- You should have an AWS account with permissions to access CloudFormation, S3, Lambda, and CloudFront services.
- The `YAML` CloudFormation template must be available.

### Step 1: Preparing the Template

1. Ensure you have the `YAML` template file available.

### Step 2: Launching the Stack

1. Sign in to the AWS Management Console.
2. Go to the **CloudFormation** service.
3. Click on **Create stack** > **With new resources (standard)**.
4. Choose **Upload a template file** if you have the template locally or **Amazon S3 URL** if the template is hosted in an S3 bucket. Click **Next**.
5. Enter a stack name, such as `S3MigratorCloudFrontStack`.

### Step 3: Entering Parameters

1. Enter the required parameters:
   - **SourceBucketName**: Name of the source S3 bucket.
   - **DestinationBucketName**: Name of the destination S3 bucket. It will be created if it doesn't already exist.
2. Proceed by clicking **Next**.

### Step 4: Configuring Stack Options

1. Configure any stack options as needed, such as tags. Click **Next**.

### Step 5: Review and Deploy

1. Review your stack settings. Check the box acknowledging that CloudFormation might create IAM resources.
2. Click **Create stack** to launch your CloudFormation stack.

### Step 6: Monitor the Stack Creation

1. Monitor the stack creation process in the CloudFormation console.
2. Wait for the stack status to change to **CREATE_COMPLETE**.

### Step 7: Review Outputs (optional)

1. Upon successful stack creation, navigate to the **Outputs** tab in the CloudFormation console.
2. Note down important outputs such as the Destination S3 Bucket Name, CloudFront Distribution URL, Lambda Function ARN, and CloudFront Distribution ID.

### Step 8: Post-Launch Verification

1. Verify that data migration to the destination S3 bucket was successful.
2. Test the CloudFront distribution to ensure it's serving content correctly.

---

# Secure Data Migration - S3Migrator.yaml

This Service Catalog product provides a secure process for migrating data from one S3 bucket to another. It ensures that the destination bucket is created and configured correctly, and public access is disabled on the source bucket to secure the data during the migration process.

## Description

The S3Migrator product in Service Catalog automates the process of transferring objects from a source S3 bucket to a newly created destination bucket. This migration is handled in a serverless manner, using AWS Lambda to transfer the objects securely and efficiently.

## Resources Created

- **Destination S3 Bucket**: A new S3 bucket is created to serve as the destination for the migrated data. If the bucket already exists, it will be utilized for the same purpose.
- **Lambda Execution Role**: An IAM role is established, giving necessary permissions to the Lambda function to access and perform operations on S3 buckets.
- **Lambda Function**: The core of the migration process, where a Lambda function is triggered to transfer data from the source to the destination bucket.

## Parameters

- **SourceBucketName**: The name of the existing S3 bucket from which data will be migrated.
- **DestinationBucketName**: The name for the new destination S3 bucket, which will be created by the template if it does not exist.

## Security

The product is designed with security as a priority, ensuring:

- The source S3 bucket's data is migrated without exposing it to the public internet.
- Only necessary permissions are granted to the Lambda function to perform its operations, following the principle of least privilege.

## Service Catalog Execution Steps

To deploy the S3Migrator product using Service Catalog, follow these instructions:

### Prerequisites

- Appropriate permissions in Service Catalog.
- Access to Amazon S3 and AWS Lambda services.

### Step 1: Accessing the Product

1. Sign in to the AWS Management Console.
2. Navigate to **Service Catalog**.
3. In the **Provisioning** section, select **Products**.
4. Find and select the product.
5. Press the **Launch product** button.

### Step 2: Product Configuration

1. Assign a name to your provisioned product for easy identification.
2. Proceed by clicking **NEXT**.

### Step 3: Enter Parameters

1. Specify the **SourceBucketName**, the S3 bucket from which data will be migrated.
2. Enter the **DestinationBucketName** for the new destination S3 bucket.
3. Modify additional parameters if necessary.
4. Proceed by clicking **NEXT**.

### Step 4: Review and Launch

1. Double-check all configurations to ensure they are accurate.
2. Initiate the resource creation by clicking **LAUNCH**.

### Step 5: Monitor the Launch

1. Track the provisioning process within the Service Catalog console.
2. Await until the status indicates **SUCCEEDED**.

### Step 6: Review Outputs (optional)

1. Once the provisioning is successful, visit the **Outputs** section to obtain details such as the names of the destination bucket and the Lambda function ARN.

### Step 7: Post-Launch Verification

1. Ensure that the data has been transferred correctly to the destination bucket.
2. Review the Lambda function's execution logs for any potential issues or errors.

## CloudFormation Execution Steps

This method offers an alternative to Service Catalog, providing direct deployment and management of resources.

### Prerequisites

- You should have an AWS account with permissions to access CloudFormation, S3, Lambda, and CloudFront services.
- The `YAML` CloudFormation template must be available.

### Step 1: Preparing the Template

1. Ensure you have the `YAML` template file available.

### Step 2: Launching the Stack

1. Sign in to the AWS Management Console.
2. Go to the **CloudFormation** service.
3. Click on **Create stack** > **With new resources (standard)**.
4. Choose **Upload a template file** if you have the template locally or **Amazon S3 URL** if the template is hosted in an S3 bucket. Click **Next**.
5. Enter a stack name, such as `S3MigratorCloudFrontStack`.

### Step 3: Entering Parameters

1. Enter the required parameters:
   - **SourceBucketName**: Name of the source S3 bucket.
   - **DestinationBucketName**: Name of the destination S3 bucket. It will be created if it doesn't already exist.
2. Proceed by clicking **Next**.

### Step 4: Configuring Stack Options

1. Configure any stack options as needed, such as tags. Click **Next**.

### Step 5: Review and Deploy

1. Review your stack settings. Check the box acknowledging that CloudFormation might create IAM resources.
2. Click **Create stack** to launch your CloudFormation stack.

### Step 6: Monitor the Stack Creation

1. Monitor the stack creation process in the CloudFormation console.
2. Wait for the stack status to change to **CREATE_COMPLETE**.

### Step 7: Review Outputs (optional)

1. Upon successful stack creation, navigate to the **Outputs** tab in the CloudFormation console.
2. Note down important outputs such as the Destination S3 Bucket Name, CloudFront Distribution URL, Lambda Function ARN, and CloudFront Distribution ID.

### Step 8: Post-Launch Verification

1. Verify that data migration to the destination S3 bucket was successful.
2. Test the CloudFront distribution to ensure it's serving content correctly.

---

# CloudFront Distribution Configuration for S3 Bucket - CloudFront-Enforcer.yaml

This AWS CloudFormation template is designed to secure and accelerate the delivery of your S3 bucket content by configuring a CloudFront distribution. It disables public access and static website hosting on the S3 bucket, ensuring exclusive content delivery through the CloudFront CDN.

## Description

The template provisions a CloudFront distribution to interface with an existing S3 bucket, creating a secure and high-performance content delivery network. It also applies necessary security configurations to the S3 bucket, such as blocking public access and deleting any existing website configuration, to ensure that the content can only be accessed through CloudFront.

## Resources Created

- **CloudFront Origin Access Control (OAC)**: Ensures that the S3 bucket can only be accessed via the CloudFront distribution.
- **S3 Bucket Policy**: Grants the CloudFront distribution permission to access objects within the S3 bucket.
- **CloudFront Distribution**: Configures the CDN with optimal settings for delivering your content.
- **Lambda Execution Role**: An IAM role that allows Lambda to manage S3 bucket policies.
- **Lambda Function**: Executes changes on the S3 bucket, such as applying public access blocks and removing static website hosting.
- **S3WebsiteDisableInvoker**: A custom resource that triggers the Lambda function.

## Parameters

- **S3BucketName**: The name of the existing S3 bucket to which the CloudFront distribution will be connected.

## Security

Security configurations are automatically applied to ensure that:

- The S3 bucket's content is not publicly accessible.
- All content requests are routed through CloudFront, taking advantage of AWS's global edge network.

## Service Catalog Product Execution Steps

To deploy the configured CloudFront distribution for an S3 bucket using the Service Catalog, follow the steps below:

### Prerequisites

- Required permissions in Service Catalog.
- Access to the Amazon S3 and CloudFront services.

### Step 1: Accessing the Product

1. Log in to the AWS Management Console.
2. Proceed to **Service Catalog**.
3. Under **Provisioning**, select **Products**.
4. Choose the product with the corresponding name to the CloudFront-S3-Bucket template.
5. Click **Launch product**.

### Step 2: Product Configuration

1. Name the provisioned product for ease of identification.
2. Click **NEXT** to proceed.

### Step 3: Enter Parameters

1. Input the **S3BucketName** for the S3 bucket you want to configure with CloudFront.
2. Confirm any additional configurable parameters.
3. Click **NEXT** to review your settings.

### Step 4: Review and Launch

1. Double-check the configurations for accuracy.
2. Click **LAUNCH** to begin creating the CloudFront distribution and applying the necessary configurations to the S3 bucket.

### Step 5: Monitor the Launch

1. Monitor the provisioning process through the Service Catalog console.
2. Wait for the status to indicate **SUCCEEDED**.

### Step 6: Review Outputs (optional)

1. After the provisioning is successful, verify the **Outputs** section for the distribution URL and other resource identifiers.
2. Document the CloudFront distribution details and the Origin Access Control ID.

### Step 7: Post-Launch Verification

1. Check the S3 bucket to ensure that public access is effectively blocked.
2. Access the content through the provided CloudFront URL to confirm proper setup and functionality.
3. Review and apply any additional security or performance configurations as necessary.

## CloudFormation Execution Steps

This method offers an alternative to Service Catalog, providing direct deployment and management of resources.

### Prerequisites

- You should have an AWS account with permissions to access CloudFormation, S3, Lambda, and CloudFront services.
- The `YAML` CloudFormation template must be available.

### Step 1: Preparing the Template

1. Ensure you have the `YAML` template file available.

### Step 2: Launching the Stack

1. Sign in to the AWS Management Console.
2. Go to the **CloudFormation** service.
3. Click on **Create stack** > **With new resources (standard)**.
4. Choose **Upload a template file** if you have the template locally or **Amazon S3 URL** if the template is hosted in an S3 bucket. Click **Next**.
5. Enter a stack name, such as `S3MigratorCloudFrontStack`.

### Step 3: Entering Parameters

1. Enter the required parameters:
   - **SourceBucketName**: Name of the source S3 bucket.
   - **DestinationBucketName**: Name of the destination S3 bucket. It will be created if it doesn't already exist.
2. Proceed by clicking **Next**.

### Step 4: Configuring Stack Options

1. Configure any stack options as needed, such as tags. Click **Next**.

### Step 5: Review and Deploy

1. Review your stack settings. Check the box acknowledging that CloudFormation might create IAM resources.
2. Click **Create stack** to launch your CloudFormation stack.

### Step 6: Monitor the Stack Creation

1. Monitor the stack creation process in the CloudFormation console.
2. Wait for the stack status to change to **CREATE_COMPLETE**.

### Step 7: Review Outputs (optional)

1. Upon successful stack creation, navigate to the **Outputs** tab in the CloudFormation console.
2. Note down important outputs such as the Destination S3 Bucket Name, CloudFront Distribution URL, Lambda Function ARN, and CloudFront Distribution ID.

### Step 8: Post-Launch Verification

1. Verify that data migration to the destination S3 bucket was successful.
2. Test the CloudFront distribution to ensure it's serving content correctly.

---

# S3 Bucket Metrics Retrieval Script - BucketSize.py

Python script that retrieves the total size and number of objects in an Amazon S3 bucket using CloudWatch Metrics, without querying the bucket directly.

## Prerequisites

Before running this script, ensure you have the following:

- Python 3 installed.
- AWS CLI configured with at least one profile.
- Boto3 installed. You can install it using pip:

  ```
  pip install boto3
  ```

## Usage

To use this script, you need to provide the name of the S3 bucket and the AWS region where the bucket is hosted as command-line arguments.

### Syntax

```bash
python BucketSize.py --bucket <BUCKET_NAME> --region <AWS_REGION>
```

### Arguments

- `-b` or `--bucket`: **Required**. The name of the S3 bucket.
- `-r` or `--region`: **Required**. The AWS region of the S3 bucket.

### Examples

```bash
python BucketSize.py --bucket my-s3-bucket --region us-east-1
```
