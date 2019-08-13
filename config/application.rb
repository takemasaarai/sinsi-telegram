require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module SinsiT
  class Application < Rails::Application
    # Time zone.
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # Default lang.
    config.i18n.default_locale = :ja
    # PATH
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
