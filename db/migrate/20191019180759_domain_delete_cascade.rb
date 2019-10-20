class DomainDeleteCascade < ActiveRecord::Migration[6.0]
  def change
  	  remove_reference :domains, :domains
  	  remove_reference :records, :domain

  	  add_reference :records, :domain, foreign_key: true, on_delete: :cascade
  	  add_reference :domains, :domains, foreign_key: true, on_delete: :cascade
  end
end
