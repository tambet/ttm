require 'rubygems'
require 'crack'
require 'sinatra'
require 'activerecord'

require 'lib/models'

get '/' do
  'REST API List'
end

#================= Customers API =================#

get '/customers.xml' do
  content_type 'application/xml', :charset => 'utf-8'
  Customer.all.to_xml
end

get '/customers/new.xml' do
  content_type 'application/xml', :charset => 'utf-8'
  Customer.new.to_xml
end

post '/customers.xml' do
  params.merge!(Crack::XML.parse(request.body.read))
  Customer.create!(params[:customer])
end

get '/customers/:id.xml' do
  content_type 'application/xml', :charset => 'utf-8'
  Customer.find(params[:id]).to_xml
end

put '/customers/:id.xml' do
  params.merge!(Crack::XML.parse(request.body.read))
  customer = Customer.find(params[:id])
  customer.update_attributes(params[:customer])
end

delete '/customers/:id.xml' do
  Customer.find(params[:id]).destroy
end


#================= Addresses API =================#

get '/customers/:customer_id/addresses.xml' do
  content_type 'application/xml', :charset => 'utf-8'
  Customer.find(params[:customer_id]).addresses.to_xml
end

post '/customers/:customer_id/addresses.xml' do
  params.merge!(Crack::XML.parse(request.body.read))
  p params
  #Address.create(params[:address])
end

get '/customers/:customer_id/addresses/:id.xml' do
  content_type 'application/xml', :charset => 'utf-8'
  Address.find(params[:id]).to_xml
end

put '/customers/:customer_id/addresses/:id.xml' do
  params.merge!(Crack::XML.parse(request.body.read))
  address = Address.find(params[:id])
  address.update_attributes(params[:address])
end

delete '/customers/:customer_id/addresses/:id.xml' do
  Address.find(params[:id]).destroy
end
