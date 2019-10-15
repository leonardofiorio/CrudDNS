class CreateDomains < ActiveRecord::Migration[6.0]
  def change
    create_table :domains do |t|
      t.string :name
      t.string :type
      t.string :ttl
      t.string :primary_name_server
      t.string :contact
      t.string :refresh
      t.string :retry
      t.string :expire
      t.string :minimum

      t.timestamps
    end
  end
end
