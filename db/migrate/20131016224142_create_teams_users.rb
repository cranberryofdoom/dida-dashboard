class CreateTeamsUsers < ActiveRecord::Migration
	def change
		create_table :teams_users do |t|
			t.belongs_to :team
			t.belongs_to :user
			t.integer :team_id, :user_id
		end
		add_index :teams_users, :team_id
		add_index :teams_users, :user_id
	end
end
