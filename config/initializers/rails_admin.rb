RailsAdmin.config do |config|
  config.main_app_name = ["My App", "Admin"]
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
end
