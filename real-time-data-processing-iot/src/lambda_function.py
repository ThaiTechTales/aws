import json
import boto3
import os
import base64  # Import base64 for decoding Kinesis data

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])

def lambda_handler(event, context):
    for record in event['Records']:
        try:
            # Log the raw Kinesis data for debugging
            raw_data = record['kinesis']['data']
            print(f"Raw Kinesis Data (Base64): {raw_data}")
            
            # Decode Base64 data
            decoded_data = base64.b64decode(raw_data).decode('utf-8')
            print(f"Decoded Data: {decoded_data}")
            
            # Parse JSON from decoded data
            payload = json.loads(decoded_data)
            print(f"Parsed Payload: {payload}")
            
            # Store data in DynamoDB
            table.put_item(Item={
                'device_id': payload['device_id'],
                'timestamp': int(payload['timestamp']),
                'temperature': payload['temperature'],
                'humidity': payload['humidity']
            })
            
        except Exception as e:
            print(f"Error processing record: {record}")
            print(f"Exception: {e}")

    return {
        'statusCode': 200,
        'body': json.dumps('Data processed and stored in DynamoDB')
    }
