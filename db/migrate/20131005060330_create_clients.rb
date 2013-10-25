class CreateClients < ActiveRecord::Migration
	def change
		create_table :clients do |t|

			t.string :email, :first_name, :last_name, :department
			t.integer :cell

			t.timestamps
		end
	end
end
