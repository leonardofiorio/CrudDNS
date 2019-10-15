class AddZonaPai < ActiveRecord::Migration[6.0]
  def change
  	add_reference :domains, :is_contained
  end
end
