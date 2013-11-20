class AddFirstUser < ActiveRecord::Migration
  def up
  	u = User.create(:email => "ashley.qian@duke.edu", :password => "password", :password_confirmation => 
  		"password", :privilege => "admin")
  	u.update_attributes :confirmed_at => Time.now
  end
  def down

  end
end
