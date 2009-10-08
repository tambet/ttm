dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']
ActiveRecord::Base.logger = Logger.new(STDOUT)

class User < ActiveRecord::Base
end

class Store < ActiveRecord::Base
end

class Customer < ActiveRecord::Base
  set_table_name "customer"
  set_primary_key "customer"
  # to_xml(:except => [:customer], :methods => [:id])
end

class Contract < ActiveRecord::Base
  set_table_name "contract"
  set_primary_key "contract"
  # to_xml(:except => [:contract], :methods => [:id])
end

class CustomerAddress < ActiveRecord::Base
  set_table_name "cst_address"
  set_primary_key "cst_address"
  # to_xml(:except => [:cst_address], :methods => [:id])
end
