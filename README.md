# Thumbnail generator
Thumbnail generator App deployed in AWS using Terraform and Github Actions.

We have found a time machine and went back in time! The year is 2000 and social media is just taking off. The hottest thing is a thumbnail generator: you input a big picture and get a small picture as  output.

## Description

This is a simple app that generates a thumbnail from a given image. The app is deployed in AWS using the following services:

- S3
- Lambda
- API Gateway

### Requirements

- Terraform
- AWS CLI
- Poetry

#### Recommended tools

- tfswitch

## How it works

The app is composed of 3 main components:
- **API Gateway**: This is the entry point of the app. It receives the image URL and the desired thumbnail size. It then sends a message to an SQS queue with the image URL and the desired thumbnail size.
- **Lambda**: This is the core of the app. It listens to the SQS queue and processes the messages. It downloads the image from the given URL, generates the thumbnail and uploads it to an S3 bucket. It also stores the image URL, the thumbnail URL and the desired thumbnail size in a DynamoDB table.
- **S3**: This is used to store the images and the thumbnails.
- **CloudWatch**: This is used to monitor the app.

## About the architecture
### Strengths

- **Scalability**: The app is designed to be scalable. It can handle a large number of requests and it can be easily scaled up or down.
- **Reliability**: The app is designed to be reliable. It can handle failures and it can be easily recovered from failures.
- **Performance**: The app is designed to be performant. It can handle a large number of requests and it can be easily optimized for performance.
- **Security**: The app is designed to be secure. It can handle a large number of requests and it can be easily secured.
- **Cost**: The app is designed to be cost-effective. It can handle a large number of requests and it can be easily optimized for cost.
- **Flexibility**: The app is designed to be flexible. It can handle a large number of requests and it can be easily adapted to different use cases.
- **Maintainability**: The app is designed to be maintainable. It can handle a large number of requests and it can be easily maintained.
- **Usability**: The app is designed to be usable. It can handle a large number of requests and it can be easily used.
- **Accessibility**: The app is designed to be accessible. It can handle a large number of requests and it can be easily accessed.
- **Interoperability**: The app is designed to be interoperable. It can handle a large number of requests and it can be easily integrated with other systems.

### Weaknesses

- **Complexity**: The app is complex. It can be difficult to understand and maintain.
- **Cost**: The app can be expensive. It can be difficult to optimize for cost.
- **Performance**: The app can be slow. It can be difficult to optimize for performance.
- **Scalability**: The app can be difficult to scale. It can be difficult to handle a large number of requests.
- **Reliability**: The app can be unreliable. It can be difficult to recover from failures.
