class CriarClassrecordRenomearAtributos < ActiveRecord::Migration[6.0]
  def change
  	add_column :records, :class_record, :string
  	rename_column :records, :host, :name
  end
end
