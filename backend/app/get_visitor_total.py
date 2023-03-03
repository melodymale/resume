import logging

from db_client import DBClient

logger = logging.getLogger(__name__)


def get_visitor_total(db_client: DBClient, key: dict) -> int:
    logger.info("get visitor total")
    total = db_client.get_item(key=key)
    return total
