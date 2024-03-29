require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Japanizer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Slim for template engine
    config.generators.template_engine = :slim

    # default locale
    config.i18n.default_locale = :ja
    # config.i18n.default_locale = :en
    # Read locale files
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    # WhiteList of language for Japanizer
    config.i18n.available_locales = %i[ja en]
    # Set error case other languages set
    config.i18n.enforce_available_locales = true

  end
end
