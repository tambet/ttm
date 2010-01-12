require 'rubygems'
require 'crack'
require 'minion'
require 'sinatra'
require 'active_record'
require 'active_support'

APP_KEY = 'ttm-1'
INT_KEY = 'ttm-2'

ENV["AMQP_URL"] = "amqp://guest:guest@tm.pri.ee/"

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']
#ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = Logger.new('log/ttm.log')
