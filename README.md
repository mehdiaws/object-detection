# Unauthorized Personnel Detection 

## What this solution is about?
This solution is for building an end-to-end computer vision based web application for detecting if someone is carrying/wearing required tools or equipment. The application can also detect if someone is carrying banned items (e.g., drinks, weapons etc). When there is a violation the application sends notifications and displays snapshots of them in the web app. 

This application utilizes Amazon Rekognition object detection capabilities and is meant for quick demos for customers. This solution should be deployed on a local machine with a webcam for successful demo purposes. It requires installing Python 2.7 on the local machine.

## Solution Details

For installing the app, we first build the back-end component on the AWS Cloud which deploys a serverless application using services such as Lambda, Kinesis, Rekognition, S3, SNS, and API Gateway. We will also build the front-end component which will be hosted on the local machine. These steps have all been automated in a CloudFormation template which available on the GitHub repo. 

Create an s3 bucket and store your employee images with .png extension there. Clone this repo and in `step1.sh`, edit it as follows (no “ needed): Replace YOUR PIX BUCKET with your pix bucket name. replace YOUR CELLPHONE NUMBER with your number (e.g.: +188888888888). Replace YOUR SNS TOPIC ARN with your SNS arn.

Run `step1.sh` to install the from-end and back-end components.

Copy and paste http://localhost:8080 into your browser. Your created WebUI should be displayed.
Make sure CFN stack was created in step 1 and then open a new terminal and run `step2.sh` (this will start your laptop webcam).
