CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJNYNPBRODE6QZJBQ',       # copied off the aws site
    :aws_secret_access_key  => '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',       #
  }

  config.fog_directory  = 'static_garage'                     # required
  config.fog_host       = nil                                 # optional, defaults to nil
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
