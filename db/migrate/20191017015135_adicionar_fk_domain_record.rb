class AdicionarFkDomainRecord < ActiveRecord::Migration[6.0]
  def change
  	add_reference :records, :domain, index: true
  	add_foreign_key :records, :domains
  end
end
