require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# require "view_component/engine"

Bundler.require(*Rails.groups)

module MarketAnalytics
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join("app", "frontend", "components")
    config.view_component.preview_paths << Rails.root.join("app", "frontend", "components")
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    #
    config.active_record.yaml_column_permitted_classes = [Symbol, Date]

    config.time_zone = "Moscow"
    config.active_record.default_timezone = :utc
    # config.eager_load_paths << Rails.root.join("extras")
    #
    # config.i18n.default_locale = :ru
    config.i18n.default_locale = :ru

    config.autoload_paths << "#{Rails.root}/app/processes"
    # config.autoload_paths += Dir[Rails.root.join('app', 'jobs', '**/')]
    # config.autoload_paths += Dir[Rails.root.join('app', 'models', '**/')]
    # config.autoload_paths += Dir[Rails.root.join('app', 'mailers', '**/')]

    config.generators do |g|
      g.orm :active_record
      g.template_engine :erb
      g.test_framework :test_unit, fixture: true
    end

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

  end
end
