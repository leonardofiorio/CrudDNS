class RenomearColunasRecords < ActiveRecord::Migration[6.0]
  def change
  	rename_column :records, :type, :type_record
  end
end
