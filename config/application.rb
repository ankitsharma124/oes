require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Oes
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.to_prepare do
      Devise::SessionsController.layout "login.html.erb"
      Devise::RegistrationsController.layout "login.html.erb"
      Devise::ConfirmationsController.layout "login.html.erb"
      Devise::UnlocksController.layout "login.html.erb"
      Devise::PasswordsController.layout "login.html.erb"
  end
  end
end