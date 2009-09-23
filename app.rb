require 'rubygems'
require 'sinatra'
require 'activerecord'

require 'lib/models'

get '/' do
  'Hello world!'
end

get '/users' do
  User.all.to_xml
end
