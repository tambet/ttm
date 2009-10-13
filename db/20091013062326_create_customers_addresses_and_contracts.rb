class CreateCustomersAddressesAndContracts < ActiveRecord::Migration
  def self.up
    create_table "contract", :primary_key => "contract", :force => true do |t|
      t.integer  "contract_manager",     :limit => 30,  :precision => 30, :scale => 0
      t.integer  "contract_status_type", :limit => 30,  :precision => 30, :scale => 0
      t.integer  "customer",             :limit => 30,  :precision => 30, :scale => 0
      t.integer  "contract_type",        :limit => 30,  :precision => 30, :scale => 0
      t.string   "cnt_number",           :limit => 20
      t.string   "name",                 :limit => 200
      t.string   "description",          :limit => 300
      t.datetime "valid_from"
      t.datetime "valid_to"
      t.integer  "parent_cnt",           :limit => 30,  :precision => 30, :scale => 0
      t.datetime "created"
      t.datetime "updated"
      t.integer  "created_by",           :limit => 30,  :precision => 30, :scale => 0
      t.integer  "updated_by",           :limit => 30,  :precision => 30, :scale => 0
      t.string   "conditions",           :limit => 300
      t.string   "note",                 :limit => 300
      t.decimal  "value_amount",                        :precision => 32, :scale => 16
      t.integer  "struct_unit",          :limit => 30,  :precision => 30, :scale => 0
    end

    create_table "cst_address", :primary_key => "cst_address", :force => true do |t|
      t.integer  "customer",     :limit => 30,  :precision => 30, :scale => 0
      t.string   "zip",          :limit => 20
      t.string   "house",        :limit => 100
      t.string   "address",      :limit => 100
      t.string   "county",       :limit => 100
      t.string   "parish",       :limit => 100
      t.string   "town_county",  :limit => 100
      t.integer  "address_type", :limit => 30,  :precision => 30, :scale => 0
      t.string   "phone",        :limit => 20
      t.string   "sms",          :limit => 20
      t.string   "mobile",       :limit => 20
      t.string   "email",        :limit => 30
      t.string   "note",         :limit => 50
      t.integer  "country",      :limit => 30,  :precision => 30, :scale => 0
      t.datetime "created"
      t.datetime "updated"
      t.integer  "created_by",   :limit => 30,  :precision => 30, :scale => 0
      t.integer  "updated_by",   :limit => 30,  :precision => 30, :scale => 0
    end

    create_table "customer", :primary_key => "customer", :force => true do |t|
      t.string   "first_name",     :limit => 100
      t.string   "last_name",      :limit => 100
      t.string   "identity_code",  :limit => 20
      t.string   "note",           :limit => 1000
      t.datetime "created"
      t.datetime "updated"
      t.integer  "created_by",     :limit => 30,   :precision => 30, :scale => 0
      t.integer  "updated_by",     :limit => 30,   :precision => 30, :scale => 0
      t.datetime "birth_date"
      t.integer  "cst_type",       :limit => 2,    :precision => 2,  :scale => 0
      t.integer  "cst_state_type", :limit => 2,    :precision => 2,  :scale => 0
    end
  end

  def self.down
    drop_table  :contract
    drop_table  :cst_address
    drop_table  :customer
  end
end
