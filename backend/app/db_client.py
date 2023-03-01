from typing import Protocol


class DBClient(Protocol):
    def get_item(self):
        pass

    def update_item(self):
        pass
