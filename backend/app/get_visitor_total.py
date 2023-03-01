from db_client import DBClient


def get_visitor_total(db_client: DBClient, key: dict) -> int:
    print("get visitor total")
    total = db_client.get_item(key=key)
    return total
