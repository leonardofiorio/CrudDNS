class AlterarColunaType < ActiveRecord::Migration[6.0]
  def change
  	change_table :domains do |t|
  		t.rename :type, :type_domain
	end
  end
end
