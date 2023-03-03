from app.update_visitor_total import update_visitor_total
from dummy_db_client import DummyDBClient


def test_update_visitor_total():
    dummy_db_client = DummyDBClient()
    assert dummy_db_client.total_visitor == 0

    result = update_visitor_total(db_client=dummy_db_client, key={"id": "mockup"})
    assert result == 0
