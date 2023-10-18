Rails.application.configure do
  config.lograge.enabled = true
  # add time to lograge

  config.lograge.custom_payload do |controller|
    request = controller.request
    {
      host: request.host,
      path: request.path,
      query_string: request.query_string,
      referer: request.referer,
      user_agent: request.user_agent,
      time: Time.now
    }
  end
end
