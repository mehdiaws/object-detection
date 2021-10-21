{\rtf1\ansi\ansicpg1252\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Monaco;}
{\colortbl;\red255\green255\blue255;\red1\green30\blue103;\red255\green0\blue0;}
{\*\expandedcolortbl;;\csgenericrgb\c392\c11765\c40392;\csgenericrgb\c100000\c0\c0;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\ri0\sl320\partightenfactor0

\f0\fs18 \cf2 cd ~\
mkdir envs_test\
cd envs_test\
pip install virtualenv\
virtualenv -p /usr/bin/python2.7 my_env\
source my_env/bin/activate\
cd my_env\
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python\
aws s3api get-object --bucket mehdibucket1 --key app_req.zip app.zip\
unzip app.zip -d ./app\
cd ./app\
pip install -r requirements.txt\
pip install pytz -t lambda/imageprocessor/\
sed -i -e "s/<+188888888888>/\cf3 YOUR CELLPHONE NUMBER\cf2 /g" "config/imageprocessor-params.json"\
sed -i -e "s/<Your SNS arn>/\cf3 YOUR SNS TOPIC ARN\cf2 /g" "config/imageprocessor-params.json"\
SourceS3Bucket=$(openssl rand -hex 10)\
SourceS3Bucket="sources3bucket"$SourceS3Bucket\
sed -i -e "s/<Source DEFAULT>/$SourceS3Bucket/g" "config/cfn-params.json"\
FrameS3Bucket=$(openssl rand -hex 10)\
FrameS3Bucket="frames3bucket"$FrameS3Bucket\
sed -i -e "s/<Frame DEFAULT>/$FrameS3Bucket/g" "config/cfn-params.json"\
sed -i -e "s/<NO-DEFAULT>/$FrameS3Bucket/g" "config/imageprocessor-params.json"\
stackname=$(openssl rand -hex 4)\
stackname="video-analyzer"$stackname\
sed -i -e "s/video-analyzer/$stackname/g" "config/global-params.json"\
pynt packagelambda\
pynt deploylambda\
pynt createstack\
pynt webui\
pynt webuiserver}