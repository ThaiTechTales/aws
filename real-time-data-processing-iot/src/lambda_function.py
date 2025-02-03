import json
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])

def lambda_handler(event, context):
    for record in event['Records']:
        payload = json.loads(record['kinesis']['data'])
        table.put_item(Item={
            'device_id': payload['device_id'],
            'timestamp': int(payload['timestamp']),
            'temperature': payload['temperature'],
            'humidity': payload['humidity']
        })
    return {
        'statusCode': 200,
        'body': json.dumps('Data processed and stored in DynamoDB')
    }
