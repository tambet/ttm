require 'config/environment'
APP_KEY = 'ttm-1'

include Minion

job "#{APP_KEY}.customer" do |args|
  puts args['customer']
end
