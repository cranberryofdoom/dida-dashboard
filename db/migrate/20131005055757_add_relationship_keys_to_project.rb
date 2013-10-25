class AddRelationshipKeysToProject < ActiveRecord::Migration
	def change
		change_table :projects do |t|
			
			t.integer :client_id, :team_id, :user_id
		end

		add_index :projects, :client_id
		add_index :projects, :team_id
		add_index :projects, :user_id
	end
end
