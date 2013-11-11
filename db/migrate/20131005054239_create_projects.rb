class CreateProjects < ActiveRecord::Migration
	def change
		create_table :projects do |t|

			t.string :mediums, :kind, :status
			t.date :due_date
			t.text :details, :direction

			t.timestamps
		end
	end
end
