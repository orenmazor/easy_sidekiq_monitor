require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { :size => 1 }
end

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == ['admin', 'admin']
end

require 'sidekiq/web'
run Sidekiq::Web
