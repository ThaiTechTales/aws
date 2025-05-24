import boto3
from botocore.exceptions import ClientError

# Function to upload a file to an S3 bucket
# Uses boto3 to interface with AWS S3
# Raises a RuntimeError if the AWS call fails

def upload_file_to_s3(bucket_name, key, body):
    s3 = boto3.client("s3")
    try:
        s3.put_object(Bucket=bucket_name, Key=key, Body=body)
    except ClientError as e:
        raise RuntimeError(f"Failed to upload object: {e}")