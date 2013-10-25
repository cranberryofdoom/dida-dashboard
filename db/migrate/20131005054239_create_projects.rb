class CreateProjects < ActiveRecord::Migration
	def change
		create_table :projects do |t|

			t.string :medium, :kind, :status
			t.datetime :due_date
			t.text :details, :direction

			t.timestamps
		end
	end
end
