class DomainDeleteCascadeFk < ActiveRecord::Migration[6.0]
  def change
  	remove_foreign_key :records, :domains
  	add_foreign_key :records, :domains, foreign_key: true, on_delete: :cascade
  end
end
