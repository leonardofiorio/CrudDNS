class CreateFkDomainToDomainOnCascade < ActiveRecord::Migration[6.0]
  def change
    add_reference :domains, :domains, foreign_key: { on_delete: :cascade}
  end
end
