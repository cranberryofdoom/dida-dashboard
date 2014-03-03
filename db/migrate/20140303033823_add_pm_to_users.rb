class AddPmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :project_manager, :boolean, :default => false
  end

  def self.down
    remove_column :users, :project_manager
  end
end
