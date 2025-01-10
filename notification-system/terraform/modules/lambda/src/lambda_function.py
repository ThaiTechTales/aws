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
        
        # Parse the SNS message, which is a JSON-encoded string, into a python dictionary
        sns_message = json.loads(message_body)
        
        # If 'Message' key is present, it means the message is nested
        #   E.g. The record may have a 'Message' key, which contains a "body" key with the actual message such as "test-message-1"
        #   If it does exist, we extract the nested message and parse it 
        #       into a python dictionary so the body is the only thing we have to work with.
        if 'Message' in sns_message:
            try:
                sns_message = json.loads(sns_message['Message'])
                logger.info(f"Extracted nested message: {sns_message}")
            except json.JSONDecodeError:
                logger.warning("Error extracting nested message")
        
        # Write message to S3
        file_name = f"processed_message_{record['messageId']}.json"
        try:
            s3_client.put_object(
                Bucket=bucket_name,
                Key=file_name,
                Body=json.dumps({"message": sns_message}), # Convert the dictionary to a JSON string with the key "message" and the value of the message
                ContentType="application/json"
            )
            logger.info(f"Successfully wrote to S3: {file_name}")
        except Exception as e:
            logger.error(f"Error writing to S3: {e}")    
        
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