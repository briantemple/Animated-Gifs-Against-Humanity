OmniAuth.config.logger = Rails.logger

if ENV['AGAH_APP_ID'].blank?
  raise 'AGAH_APP_ID must be set. Please see README.'
end

if ENV['AGAH_APP_SECRET'].blank?
  raise 'AGAH_APP_SECRET must be set. Please see README.'
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['AGAH_APP_ID'], ENV['AGAH_APP_SECRET']
end
