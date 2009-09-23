require 'rubygems'
require 'sinatra'
require 'lib/models'

get '/' do
  'Hello world!'
end

get 'users' do
  'Hello users!'
end
