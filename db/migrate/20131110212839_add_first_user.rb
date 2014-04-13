class AddFirstUser < ActiveRecord::Migration
  def up
  	u_ashley = User.create(:email => "ashley.qian@duke.edu", :password => "password", :password_confirmation => 
  		"password", :first_name => "Ashley", :last_name => "Qian")
  	u_ashley.update_attributes :confirmed_at => Time.now
  	u_ann = User.create(:email => "ann.niou@gmail.com", :password => "password", :password_confirmation => 
  		"password", :first_name => "Ann", :last_name => "Niou")
  	u_ann.update_attributes :confirmed_at => Time.now
  end
  def down

  end
end
