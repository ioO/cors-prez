import falcon


class QuoteResource:
    def on_get(self, req, resp):
        """Handles GET requests"""
        quote = {
            'quote': (
                "I've always been more interested in "
                "the future than in the past."
            ),
            'author': 'Grace Hopper'
        }
        resp.status = falcon.HTTP_200
        resp.append_header('Access-Control-Allow-Origin', '*')
        resp.append_header('Allow', 'GET,OPTIONS')
        resp.append_header('Access-Control-Allow-Headers', 'Content-Type')
        resp.append_header('Access-Control-Max-Age', '86400')

        resp.media = quote


api = falcon.API()
api.add_route('/quote', QuoteResource())
