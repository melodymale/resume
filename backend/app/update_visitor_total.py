from db_client import DBClient


def update_visitor_total(db_client: DBClient, key: dict):
    print("update visitor total")
    total = db_client.update_item(key=key)
    return total
