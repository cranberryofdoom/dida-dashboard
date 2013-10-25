class CreateOrganizations < ActiveRecord::Migration
	def change
		create_table :organizations do |t|

			t.string :name
			t.text :description
			t.integer :client_id
			t.timestamps
		end
		add_index :organizations, :client_id
	end
end
