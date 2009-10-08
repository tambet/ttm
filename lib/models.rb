dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']
ActiveRecord::Base.logger = Logger.new(STDOUT)

class User < ActiveRecord::Base
end

class Store < ActiveRecord::Base
end

module RestBase
  def to_xml(options = {})
    # This doesn't work with cst_address; use table_name instead!
    super(options.merge( :except => self.class.name.underscore, :methods => :id))
  end
end

class Customer < ActiveRecord::Base
  include RestBase
  set_table_name "customer"
  set_primary_key "customer"
  has_many :contracts, :foreign_key => 'customer'
  has_many :addresses, :foreign_key => 'customer'
end

class Contract < ActiveRecord::Base
  include RestBase
  set_table_name "contract"
  set_primary_key "contract"
  belongs_to :customer
end

class Address < ActiveRecord::Base
  include RestBase
  set_table_name "cst_address"
  set_primary_key "cst_address"
  belongs_to :customer
end
