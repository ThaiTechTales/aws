import boto3
import pytest
from moto import mock_aws
from app.s3_handler import upload_file_to_s3

# Test successful upload of a file to a mocked S3 bucket
@mock_aws
def test_upload_file_to_s3():
    s3 = boto3.client("s3", region_name="ap-southeast-2")
    s3.create_bucket(
        Bucket="my-test-bucket",
        CreateBucketConfiguration={'LocationConstraint': 'ap-southeast-2'}
    )

    upload_file_to_s3("my-test-bucket", "test.txt", "Hello World")
    result = s3.get_object(Bucket="my-test-bucket", Key="test.txt")
    content = result["Body"].read().decode("utf-8")

    assert content == "Hello World"


# Test upload to a non-existent bucket, expecting an exception
@mock_aws
def test_upload_to_nonexistent_bucket_raises():
    with pytest.raises(Exception) as exc_info:
        upload_file_to_s3("non-existent-bucket", "test.txt", "fail")  # Bucket doesn't exist

    assert "Failed to upload object" in str(exc_info.value)  # Confirm exception message