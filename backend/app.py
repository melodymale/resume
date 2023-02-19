import logging

import boto3
from botocore.exceptions import ClientError

logger = logging.getLogger()
logger.setLevel(logging.INFO)

KEY = {"id": "visitor_counting"}
DYNAMO = boto3.resource("dynamodb").Table("visitor")


def lambda_handler(event, context):
    logger.info("function gets trigger")
    try:
        logger.info("update total visitor")
        response = DYNAMO.update_item(
            Key=KEY,
            UpdateExpression="ADD total_visitor :increment",
            ExpressionAttributeValues={":increment": 1},
            ReturnValues="UPDATED_NEW",
        )
    except ClientError as err:
        logger.error(
            "Couldn't update item in table %s. Here's why: %s: %s",
            DYNAMO.name,
            err.response["Error"]["Code"],
            err.response["Error"]["Message"],
        )
        raise
    else:
        logger.info("return attributes")
        return response["Attributes"]
