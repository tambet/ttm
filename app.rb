$:.unshift(File.join(File.dirname(__FILE__), "lib"))
require 'rubygems'
require 'sinatra'

require 'config/environment'
require 'models'

#require 'vendor/gems/environment'
#Bundler.require_env

before do
  content_type 'application/xml', :charset => 'utf-8'
  params.merge!(Crack::XML.parse(request.body.read))
end

get '/' do
  content_type 'text/html', :charset => 'utf-8'
  'REST API List'
end

#================= Customers API =================#

get '/customers.xml' do
  Customer.all.to_xml
end

post '/customers.xml' do
  customer = Customer.create!(params[:customer])
  customer.to_xml
end

get '/customers/:id.xml' do
  Customer.find(params[:id]).to_xml
end

put '/customers/:id.xml' do
  customer = Customer.find(params[:id])
  customer.update_attributes(params[:customer])
end

delete '/customers/:id.xml' do
  Customer.find(params[:id]).destroy
end


#================= Addresses API =================#

get '/customers/:customer_id/addresses.xml' do
  Customer.find(params[:customer_id]).addresses.to_xml
end

post '/customers/:customer_id/addresses.xml' do
  address = Address.create(params[:address])
  address.to_xml
end

get '/customers/:customer_id/addresses/:id.xml' do
  Address.find(params[:id]).to_xml
end

put '/customers/:customer_id/addresses/:id.xml' do
  address = Address.find(params[:id])
  address.update_attributes(params[:address])
end

delete '/customers/:customer_id/addresses/:id.xml' do
  Address.find(params[:id]).destroy
end
