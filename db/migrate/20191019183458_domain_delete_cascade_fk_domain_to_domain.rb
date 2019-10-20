class DomainDeleteCascadeFkDomainToDomain < ActiveRecord::Migration[6.0]
  def change
  	remove_column :domains, :domains_id
  end
end
