import base64
import pickle

encoded_string = "gASVBwAAAAAAAACMA3BpZZQu"
decoded_string = base64.b64decode(encoded_string)
obz = pickle.loads(decoded_string)
print(obz)
