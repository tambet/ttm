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


get '/users.*' do
  User.all.to_xml
end

get '/users/:id.*' do
  User.find(params[:id]).to_xml
end

post '/users.*' do
  p params
  User.create!(params[:user])
end

put '/users/:id.*' do
  User.find(params[:id]).update_attributes(params[:user])
end

delete '/users/:id.*' do
  User.find(params[:id]).destroy
end



