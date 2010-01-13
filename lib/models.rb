require 'config/environment' 

module RestBase
  def to_xml(options = {})
    super(options.merge(:except => self.class.table_name, :methods => :id))
  end
end

class Customer < ActiveRecord::Base
  include RestBase
  STATUS_IMPORTED = 1
  set_table_name "customer"
  set_primary_key "customer"
  has_many :contracts, :foreign_key => 'customer', :dependent => :destroy
  has_many :addresses, :foreign_key => 'customer', :dependent => :destroy
  after_create :broadcast
  
  def self.remote_find_or_create(params)
    customer = find_or_create_by_identity_code(params[:identity_code])
    params[:cst_state_type] = STATUS_IMPORTED
    customer.update_attributes(params)
  end
  
  def imported?
    cst_state_type == STATUS_IMPORTED
  end

  protected
  def broadcast
    Minion.enqueue("#{INT_KEY}.customer", :customer => self.to_xml) unless imported?
  end
end

class Contract < ActiveRecord::Base
  include RestBase
  set_table_name "contract"
  set_primary_key "contract"
  belongs_to :owner, :class_name => "Customer", :foreign_key => "customer"
  before_create :generate_number

  protected
  def generate_number
    self.cnt_number = ActiveSupport::SecureRandom.hex(5)
  end
end

class Address < ActiveRecord::Base
  include RestBase
  set_table_name "cst_address"
  set_primary_key "cst_address"
  belongs_to :owner, :class_name => "Customer", :foreign_key => "customer"
end
