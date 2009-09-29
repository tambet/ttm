require 'rubygems'
require 'sinatra'
require 'activerecord'

require 'lib/models'

get '/' do
  'REST API List'
end

get '/users.xml' do
  User.all.to_xml
end

post '/users.xml' do
  p params # No params with ActiveResource client:(
  User.create!(params[:user])
end

get '/users/:id.xml' do
  User.find(params[:id]).to_xml
end

put '/users/:id.xml' do
  p params # No params with ActiveResource client:(
  user = User.find(params[:id])
  user.update_attributes(params[:user])
  user.to_xml
end

delete '/users/:id.xml' do
  User.find(params[:id]).destroy
end

