Aws.config.update({
  credentials: Aws::Credentials.new('AKIAIC5SY67DTK7HSY5A', 'mJXUvcj7APplHiWIUKdK9L4HOpikFIC+6t16EpO/'),
  region: 'eu-central-1'
})

# list buckets in Amazon S3
s3 = Aws::S3::Client.new
resp = s3.list_buckets
S3_BUCKET = resp.buckets[0]
resp.buckets.map(&:name)

S3 = Aws::S3::Resource.new(region: 'eu-central-1')
