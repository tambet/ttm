require 'config/environment'
include Minion

job "#{APP_KEY}.customer" do |args|
  puts args['customer']
end
