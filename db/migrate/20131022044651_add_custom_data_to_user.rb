class AddCustomDataToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		
  		t.string :first_name, :last_name, :netid, :status, :payroll, :year, :position, :area, :cell
  		t.datetime :start_date
  	end
  end
end
