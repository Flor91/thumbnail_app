from __future__ import annotations

import base64
from io import BytesIO

import pytest
from lambda_function import lambda_handler
from PIL import Image


@pytest.fixture
def real_image_data():
    with open('chess.jpeg', 'rb') as f:
        return base64.b64encode(f.read()).decode('utf-8')


def test_lambda_handler(real_image_data):
    event = {'body': f'{{"image": "{real_image_data}"}}'}
    response = lambda_handler(event, None)

    assert response['statusCode'] == 200
    assert 'small_image' in response['body']

    # Verify size of the small image
    small_image_data = response['body']['small_image']
    small_image = Image.open(BytesIO(base64.b64decode(small_image_data)))
    assert small_image.size == (100, 100)

    # Optional - Open the image using PIL
    small_image.show()
