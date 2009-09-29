require 'rubygems'
require 'activeresource'

class User < ActiveResource::Base
  self.site = "http://localhost:4567/"
end

# User.find(:all) works

# Following doesn't work --> name and phone are not passed. Same problem with PUT request
User.create(:name => 'New User', :phone => '555-555-555')

