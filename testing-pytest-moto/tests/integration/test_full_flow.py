from app.s3_handler import upload_file_to_s3
import boto3
import pytest
from moto import mock_aws

# Integration test: end-to-end upload and verification in mocked S3
@mock_aws
def test_s3_upload_and_verify():
    bucket = "integration-test-bucket"
    key = "example.txt"
    body = "Integration content"

    s3 = boto3.client("s3", region_name="ap-southeast-2")  # Mocked S3 client
    s3.create_bucket(
            Bucket=bucket,   # Set up mocked bucket
            CreateBucketConfiguration={"LocationConstraint": "ap-southeast-2"}        
        )

    upload_file_to_s3(bucket, key, body)  # Upload to mocked bucket

    result = s3.get_object(Bucket=bucket, Key=key)  # Retrieve object
    assert result['Body'].read().decode('utf-8') == body  # Validate content

# Integration test: simulate missing bucket to check error handling
@mock_aws
def test_s3_upload_and_verify_fail_missing_bucket():
    with pytest.raises(Exception) as exc_info:
        upload_file_to_s3("missing-bucket", "fail.txt", "Should fail")  # No such bucket

    assert "Failed to upload object" in str(exc_info.value)  # Verify error message