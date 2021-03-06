#!/usr/bin/env python

from classification import predict_simple as predict

"""
To use the ResNet50 pre-trained CNN
    pip install keras tensorflow pillow
    
and then uncomment the following import...
"""

# from classification import predict_neural as predict

import glob 
import sys 
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import SocketServer
    
class PredictionServer(BaseHTTPRequestHandler):  
    TEMPLATE = open('template.html').read()
    
    @staticmethod
    def _predict():    
        results = []
        for file in glob.glob('input/*.jpg'):
            for guess in predict(file):
                results.append(str(guess))
            
        return results
        
    def _set_headers(self, content='text/html'):
        self.send_response(200)
        self.send_header('Content-type', content)
        self.end_headers()

    def do_GET(self):
        if self.path.endswith(".jpg"):
            self._set_headers('image/jpg')
            self.wfile.write(open('.' + self.path).read())
        else:
            joined = '\n'.join(PredictionServer._predict())
        
            self.wfile.write(
                PredictionServer.TEMPLATE.format(
                    predictions=(joined or "No Images!")
                )
            )

        
            

if len(sys.argv) > 1:
    server_address = ('', 80)
    httpd = HTTPServer(server_address, PredictionServer)

    print 'Starting httpd...'
    httpd.serve_forever()
else:
    predictions = PredictionServer._predict()
    
    print "Predictions for images in input/"
    for guess in predictions:
        print guess
    
    if len(predictions) == 0:
        print "No images!"
