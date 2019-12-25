# AWS credentials
AWS_ACCESS_KEY=<AWS_ACCESS_KEY>
AWS_SECRET_KEY=<AWS_SECRET_KEY>
AWS_DEFAULT_REGION=ap-south-1
S3_BUCKET_NAME=<BUCKET_NAME>

RECORDINGS_DIR=$1

echo "Uploading the recording to S3"

# Get the folder name
RECORDINGS=`ls $RECORDINGS_DIR/*.mp4`
RECORDINGS=`basename $RECORDINGS`
FOLDER_NAME=$(echo $RECORDINGS | tr "_" "\n")

for name in $FOLDER_NAME
do
        FOLDER_NAME=$name
        break
done

# Set credentials for aws cli
aws configure set aws_access_key_id $AWS_ACCESS_KEY
aws configure set aws_secret_access_key $AWS_SECRET_KEY
aws configure set default.region $AWS_DEFAULT_REGION

# Upload to S3
aws s3 sync $RECORDINGS_DIR s3://$S3_BUCKET_NAME/recordings/$FOLDER_NAME/

# Get the instance ID and terminate the EC2 instance
die() { status=$1; shift; echo "FATAL: $*"; exit $status; }
INSTANCE_ID="`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id || die \"wget instance-id has failed: $?\"`"

aws ec2 terminate-instances --instance-ids $INSTANCE_ID
