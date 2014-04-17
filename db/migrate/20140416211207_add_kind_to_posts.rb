class AddKindToPosts < ActiveRecord::Migration
	def change
		change_table :posts do |t|
			t.string :kind
		end
	end
end
