Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.credentials.dig(:github, :github_key),
           Rails.application.credentials.dig(:github, :github_secret)
end
