require 'json'
creds = JSON.load(File.read('/Users/Jen/workspace/secrets.json'))   #read file from *external* directory

Aws.config.update({
  credentials: Aws::Credentials.new(creds['AWS']['AWS_ACCESS_KEY_ID'], creds['AWS']['AWS_SECRET_ACCESS_KEY']),
  region: 'eu-central-1'
})

# list buckets in Amazon S3
s3 = Aws::S3::Client.new
resp = s3.list_buckets
S3_BUCKET = resp.buckets[0]
resp.buckets.map(&:name)

S3 = Aws::S3::Resource.new(region: 'eu-central-1')
