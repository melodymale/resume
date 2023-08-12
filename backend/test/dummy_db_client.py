class DummyDBClient:
    total_visitor = 0

    def get_item(self, key: dict):
        return self.total_visitor

    def update_item(self, key: dict):
        self.total_visitor += 1
        return self.total_visitor
