class AdicionarFkDomainDomain < ActiveRecord::Migration[6.0]
  def change
  	  	add_reference :domains, :domain, index: true
  		add_foreign_key :domains, :domains
  end
end
