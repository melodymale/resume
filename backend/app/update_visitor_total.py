import logging

from db_client import DBClient

logger = logging.getLogger(__name__)


def update_visitor_total(db_client: DBClient, key: dict):
    logger.info("update visitor total")
    total = db_client.update_item(key=key)
    return total
