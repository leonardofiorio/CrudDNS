class RemoverColunasRecords < ActiveRecord::Migration[6.0]
  def change
  	remove_column :records, :domains_id
  end
end
