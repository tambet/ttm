dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']
ActiveRecord::Base.logger = Logger.new(STDOUT)

module RestBase
  def to_xml(options = {})
    super(options.merge(:except => self.class.table_name, :methods => :id))
  end
end

class Customer < ActiveRecord::Base
  include RestBase
  set_table_name "customer"
  set_primary_key "customer"
  has_many :contracts, :foreign_key => 'customer', :dependent => :destroy
  has_many :addresses, :foreign_key => 'customer', :dependent => :destroy
end

class Contract < ActiveRecord::Base
  include RestBase
  set_table_name "contract"
  set_primary_key "contract"
  belongs_to :owner, :class_name => "Customer", :foreign_key => "customer"
end

class Address < ActiveRecord::Base
  include RestBase
  set_table_name "cst_address"
  set_primary_key "cst_address"
  belongs_to :owner, :class_name => "Customer", :foreign_key => "customer"
end
