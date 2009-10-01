require 'rubygems'
require 'activeresource'

class User < ActiveResource::Base
  self.site = "http://localhost:4567/"
end

p User.find(:all)

p User.create(:name => 'New User', :phone => '555-555-555')

