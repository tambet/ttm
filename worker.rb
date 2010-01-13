require 'config/environment'
require 'lib/models'
include Minion

job "#{APP_KEY}.customer" do |args|
  params = Crack::XML.parse(args['customer'])
  Customer.remote_find_or_create(params['customer'])
end
