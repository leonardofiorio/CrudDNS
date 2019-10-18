class RemoverColunas < ActiveRecord::Migration[6.0]
  def change
  	remove_column :domains, :domain_id
  	remove_column :domains, :is_contained_id
  	remove_column :records, :domain_id
  end
end
