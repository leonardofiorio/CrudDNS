class TrocarTiposColunasRecords < ActiveRecord::Migration[6.0]
  def change
  	change_column :domains, :refresh, :integer 
  	change_column :domains, :retry, :integer
  	change_column :domains, :expire, :integer
  	change_column :domains, :minimum, :integer
  end
end
