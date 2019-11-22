class Createbd < ActiveRecord::Migration[6.0]
  def change
  	create_table :domains do |t|
  		t.string :name
    	t.string :type_domain
    	t.string :ttl
    	t.string :primary_name_server
    	t.string :contact
    	t.integer :refresh
    	t.integer :retry
    	t.integer :expire
    	t.integer :minimum
    	t.timestamps
    	t.references :domains, index: true, foreign_key: {to_table: :domains, on_delete: :cascade}
	end


	create_table :records do |t|
		t.string :type_record
    	t.string :name
    	t.string :ttl
    	t.string :class_record
    	t.string :content
    	t.integer :priority
    	t.timestamps
	    t.references :domain, index: true, foreign_key: {to_table: :domains, on_delete: :cascade}
	end

  end
end
