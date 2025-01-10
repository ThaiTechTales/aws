import json
import boto3
import os
import logging

# Initialise AWS clients
s3_client = boto3.client('s3')
sns_client = boto3.client('sns')

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    # Get environment variables, which were created in the lambda function
    bucket_name = os.environ['S3_BUCKET']
    topic_arn = os.environ['EMAIL_TOPIC']
    
    logger.info(f"Bucket Name: {bucket_name}")
    logger.info(f"Topic ARN: {topic_arn}")
    
    # Event: Contains the message that was sent to the SQS queue    
    for record in event.get('Records', []):
        # Extract the message body
        message_body = record['body']
        
        logger.info(f"Message Body: {message_body}")
        
        # Parse the SNS message from the SQS message body
        sns_message = json.loads(message_body)
        
        # Write message to S3
        file_name = f"processed_message_{record['messageId']}.json"
        s3_client.put_object(
            Bucket=bucket_name,
            Key=file_name,
            Body=json.dumps({"message": sns_message}),
            ContentType="application/json"
        )                
        
        # Send notification via SNS
        sns_client.publish(
            TopicArn=topic_arn,
            Message=f"Processed Message: {sns_message['Message']}",
            Subject="Message Processed"
        )
    
    return {
        "statusCode": 200,
        "body": json.dumps("Messages processed and dispatched successfully.")
    }