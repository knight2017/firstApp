
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWSAccessKeyId'],
    aws_secret_access_key: ENV['AWSSecretKey'],
    region:                'us-west-2'
  }
  config.fog_directory  = 'ethanwei-1'
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
