require 'rubygems'
require 'crack'
require 'minion'
require 'sinatra'
require 'active_record'

ENV["AMQP_URL"] = "amqp://guest:guest@tm.pri.ee/"

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']
ActiveRecord::Base.logger = Logger.new(STDOUT)
