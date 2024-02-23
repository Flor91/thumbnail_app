from __future__ import annotations

import base64

import requests

api_gateway_url = 'https://anopfb0fai.execute-api.us-east-1.amazonaws.com/dev'

with open('chess.jpeg', 'rb') as f:
    image_data = base64.b64encode(f.read()).decode('utf-8')

payload = {
    'image': image_data,
}

# subprocess.run("pbcopy", text=True, input=str(payload))

response = requests.post(api_gateway_url, json=payload)
print(response.json())
print(response.status_code)
