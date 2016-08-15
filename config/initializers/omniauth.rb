Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TwitterConsumer_Key'], ENV['TwitterConsumer_Secret']
end
