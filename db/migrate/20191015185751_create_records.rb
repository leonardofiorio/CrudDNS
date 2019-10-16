class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :type
      t.string :host
      t.string :ttl
      t.string :content
      t.integer :priority

      t.timestamps
    end
  end
end
