class CreateTeams < ActiveRecord::Migration
	def change
		create_table :teams do |t|
			t.string :name
			t.integer :project_manager_id, :project_mentor_id
			t.timestamps
		end
		add_index :teams, :project_manager_id
		add_index :teams, :project_mentor_id
	end
end
