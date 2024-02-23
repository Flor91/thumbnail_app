from __future__ import annotations

import base64
import json
from io import BytesIO

from PIL import Image
from utils.image_utils import encode_image_as_base64
from utils.image_utils import resize_image


def lambda_handler(event, context):
    """Lambda function entry point.

    Resizes an image and returns the small version as base64.

    :param event: The event data passed to the function
    :param context: The runtime information passed to the function
    :return: The response data to return from the function
    """
    # Retrieve the image data from the event
    print('Received event: ' + json.dumps(event, indent=2))
    image_data = json.loads(event.get('body')).get('image')

    # Decode the base64-encoded image data
    decoded_image_data = base64.b64decode(image_data)

    # Open the image using PIL
    image = Image.open(BytesIO(decoded_image_data))

    # Resize the image to generate a small version
    small_image = resize_image(image)

    # Encode the small image as base64
    small_image_data = encode_image_as_base64(small_image)

    response = {
        'statusCode': 200,
        'body': {
            'message': 'Image resized successfully',
            'small_image': small_image_data,
        },
    }

    print('Returning response: ' + json.dumps(response, indent=2))

    return response
