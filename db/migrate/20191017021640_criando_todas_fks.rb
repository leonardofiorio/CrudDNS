class CriandoTodasFks < ActiveRecord::Migration[6.0]
  def change
  	add_reference :records, :domain, foreign_key: true
  	add_reference :domains, :domains, foreign_key: true
  end
end
