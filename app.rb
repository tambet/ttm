require 'rubygems'
require 'crack'
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
  params.merge!(Crack::XML.parse(request.body.read))
  User.create!(params[:user])
end

get '/users/:id.xml' do
  User.find(params[:id]).to_xml
end

put '/users/:id.xml' do
  params.merge!(Crack::XML.parse(request.body.read))
  user = User.find(params[:id])
  user.update_attributes(params[:user])
end

delete '/users/:id.xml' do
  User.find(params[:id]).destroy
end

