class AddFkRecord < ActiveRecord::Migration[6.0]
  def change
  	add_reference :records, :domains, index: true
  end
end
