require 'rubygems'
require 'activeresource'

class User < ActiveResource::Base
  self.site = "http://ttm.heroku.com/"
end

p User.find(:all)

p User.create(:name => 'ÕÜÄÖ õüäö', :phone => '555-555-555')

