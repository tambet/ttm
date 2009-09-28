require 'rubygems'
require 'sinatra'
require 'activerecord'

require 'lib/models'

get '/' do
  'Hello world!'
end

#get '/users' do
#  respond_with(@users = User.all)
#end

#post '/users' do
#  respond_with(@user = User.create(params[:user]))
#end

set :logging, true

get '/users.xml' do
  User.all.to_xml
end

post '/users.xml' do
  puts params
  User.create!(params[:user])
end

get '/users/:id.xml' do
  User.find(params[:id]).to_xml
end

put '/users/:id.xml' do
  p params
  user = User.find(params[:id])
  user.update_attributes(params[:user])
  user.to_xml
end

delete '/users/:id.xml' do
  User.find(params[:id]).destroy
end



