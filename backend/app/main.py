import json
import logging

from dynamo_client import DynamoClient
from get_visitor_total import get_visitor_total
from update_visitor_total import update_visitor_total

logger = logging.getLogger()
logger.setLevel(logging.INFO)

KEY = {"id": "visitor_counting"}


def lambda_handler(event, context):
    logger.info("function gets trigger")
    logger.info(event)
    body = json.loads(event["body"])
    operation = body["operation"]
    db_client = DynamoClient()

    if operation == "read":
        result = get_visitor_total(db_client=db_client, key=KEY)
    elif operation == "update":
        result = update_visitor_total(db_client=db_client, key=KEY)
    else:
        raise ValueError('Unrecognized operation "{}"'.format(operation))

    res_body = {"visitor_total": result}
    response = {
        "statusCode": 200,
        "body": json.dumps(res_body),
        "headers": {"Access-Control-Allow-Origin": "*"},
    }
    logger.info(response)
    return response
