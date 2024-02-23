from __future__ import annotations

import base64
from io import BytesIO


def resize_image(image, target_size=(100, 100)):
    """Resizes an image to the target size.

    :param image: The image to resize
    :param target_size: The target size to resize the image to
    :return: The resized image
    """
    resized_image = image.resize(target_size)
    return resized_image


def encode_image_as_base64(image):
    """Encodes an image as base64.

    :param image: The image to encode
    :return: The base64-encoded image data
    """
    buffered = BytesIO()
    image.save(buffered, format='JPEG')
    encoded_image_data = base64.b64encode(buffered.getvalue()).decode('utf-8')
    return encoded_image_data
