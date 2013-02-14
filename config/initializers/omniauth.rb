OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '107458539438174', '12dd5ef4433d342f9e7b90c7aa05e21c', scope: "email,publish_stream"

end
