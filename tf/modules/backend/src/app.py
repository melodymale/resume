import boto3
import json

tableName = "visitor"
key = {"id": "loremipsum"}
dynamo = boto3.resource("dynamodb").Table(tableName)

print("Loading function")


def lambda_handler(event, context):
    def ddb_read():
        print("Read visitor count")
        item = dynamo.get_item(Key=key)
        count = item["Item"]["count"]
        print("Current count:", count)
        return {"count": count}

    def ddb_update():
        print("Update vistor count")
        result = ddb_read()
        count = result["count"]
        count += 1
        print("Change count to", count)
        dynamo.update_item(Key=key, AttributeUpdates={"count": {"Value": count}})
        return {"result": "success", "count": count}

    operation = event["operation"]

    operations = {
        "read": ddb_read,
        "update": ddb_update,
    }

    if operation in operations:
        return operations[operation]()
    else:
        raise ValueError('Unrecognized operation "{}"'.format(operation))
