import json
import boto3
import os
import logging

# Initialise AWS clients
s3_client = boto3.client('s3')
sns_client = boto3.client('sns')
sqs_client = boto3.client('sqs')

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    # Get environment variables, which were created in the lambda function
    bucket_name = os.environ['S3_BUCKET_NAME']
    topic_arn = os.environ['EMAIL_TOPIC']
    sqs_queue = os.environ['SQS_QUEUE_URL']
    
    logger.info(f"Bucket Name: {bucket_name}")
    logger.info(f"Topic ARN: {topic_arn}")
    logger.info(f"Queue URL: {sqs_queue}")
    
    # Check if 'Records' key is in the event and if it contains any records
    if 'Records' not in event or not event['Records']:
        logger.warning("No records found in the event")
        return {
            "statusCode": 400,
            "body": json.dumps("No records found in the event")
        }
    
    # Event: Contains the message that was sent to the SQS queue    
    for record in event['Records']:
        # Extract the message body
        message_body = record['body']
        
        logger.info(f"Message Body: {message_body}")
        
        # Parse the SNS message from the SQS message body
        sns_message = json.loads(message_body)
        
        # Write message to S3
        file_name = f"processed_message_{record['messageId']}.json"
        try:
            s3_client.put_object(
                Bucket=bucket_name,
                Key=file_name,
                Body=json.dumps({"message": sns_message}),
                ContentType="application/json"
            )
            logger.info(f"Successfully wrote to S3: {file_name}")
        except Exception as e:
            logger.error(f"Error writing to S3: {e}")
        
        # Send notification via SNS
        try:
            sns_client.publish(
                TopicArn=topic_arn,
                Message=f"Processed Message: {sns_message['Message']}",
                Subject="Message Processed"
            )
            logger.info("Successfully sent SNS notification")
        except Exception as e:
            logger.error(f"Error sending SNS notification: {e}")
        
        # Delete the message from the SQS queue
        try:
            sqs_client.delete_message(
                QueueUrl=sqs_queue,
                ReceiptHandle=record['receiptHandle']
            )
            logger.info(f"Successfully deleted message: {record['messageId']}")
        except Exception as e:
            logger.error(f"Error deleting message: {e}")
    
    return {
        "statusCode": 200,
        "body": json.dumps("Messages processed and dispatched successfully.")
    }