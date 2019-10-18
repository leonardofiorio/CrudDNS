class Removendo < ActiveRecord::Migration[6.0]
  def change  
  	remove_foreign_key :domains, :domains
  	remove_column :domains, :domain_id
  end
end
