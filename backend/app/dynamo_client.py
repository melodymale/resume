import logging

import boto3
from botocore.exceptions import ClientError

logger = logging.getLogger(name=__name__)


class DynamoClient:
    table_name = "visitor"
    dynamo = boto3.resource("dynamodb").Table(table_name)

    def get_item(self, key: dict) -> int:
        item = self.dynamo.get_item(Key=key)
        count = item.get("Item", {}).get("total_visitor", 0)
        return int(count)

    def update_item(self, key: dict) -> int:
        try:
            response: dict = self.dynamo.update_item(
                Key=key,
                UpdateExpression="ADD total_visitor :increment",
                ExpressionAttributeValues={":increment": 1},
                ReturnValues="UPDATED_NEW",
            )
        except ClientError as err:
            logger.error(
                "Couldn't update item in table %s. Here's why: %s: %s",
                self.dynamo.name,
                err.response["Error"]["Code"],
                err.response["Error"]["Message"],
            )
            raise
        else:
            return int(response["Attributes"]["total_visitor"])
