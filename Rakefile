require 'config/environment'

namespace :db do
  desc "Migrate the database"
  task(:migrate) do
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db")
  end
end
