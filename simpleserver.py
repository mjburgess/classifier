#!/usr/bin/env python

from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
    
TEMPLATE = open('template.html').read()

class SimpleServer(BaseHTTPRequestHandler):      
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(TEMPLATE.format(predictions="A Simple Message!"))


server_address = ('', 80)
httpd = HTTPServer(server_address, SimpleServer)

print 'Starting httpd...'
httpd.serve_forever()

  