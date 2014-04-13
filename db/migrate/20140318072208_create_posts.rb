class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer :project_id
    	t.integer :user_id
    	t.text :content
      t.timestamps
    end
  end
end
