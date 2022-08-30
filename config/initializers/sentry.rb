if Rails.env.production?
  Sentry.init do |config|
    config.dsn = ENV["SENTRY_DSN"]
    config.breadcrumbs_logger = [:sentry_logger, :http_logger]

    # To activate performance monitoring, set one of these options.
    # We recommend adjusting the value in production:
    config.traces_sample_rate = 0.5
    # or
    config.traces_sampler = lambda do |context|
      0.5
    end
  end
end
