dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']

class User < ActiveRecord::Base
end

class Store < ActiveRecord::Base
end
