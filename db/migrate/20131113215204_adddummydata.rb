class Adddummydata < ActiveRecord::Migration
  def up
  	organization_1 = Organization.create(:name => "Jewish Student Union", :description => "Duke's student-led Jewish undergrad organization.")
  	client_1 = Client.create(:first_name => "Glenn", :last_name => "Rivkees", :email => "glenn.rivkees@duke.edu", :department => "Undergraduate Student Organization", :cell => "3364097745")
  	unassigned_project_1 = Project.create(:mediums => ["Small Flyer"], :kind => "print", :status => "unassigned", :due_date => Date.today, :details => "Want something that grabs attention and will stand out. Needs to have event details on the flyer.", :direction => "JSU 's annual Hanukkah celebration where everyone on campus is invited to enjoy latkas and share in the spirit of the holiday. This is our major event for the Fall, and we are targeting to the entire campus. We are looking a banner and poster/flyers to advertise the event. The event is on 12/4 from 6-8pm in The Loop.")
  	unassigned_project_1.client = client_1
  	unassigned_project_1.client.organization = organization_1
  	unassigned_project_1.save

    organization_2 = Organization.create(:name => "Windsor House Council", :description => "A house council.")
    client_2 = Client.create(:first_name => "Daniel", :last_name => "Li", :email => "d.li@duke.edu", :department => "Undergraduate Student Organization", :cell => "3464097545")
    unassigned_project_2 = Project.create(:mediums => ["Small Flyer"], :kind => "print", :status => "unassigned", :due_date => Date.today, :details => "No requirements really, just make it look clean and good. See attachment for logistical requirements.", :direction => "The purpose is to have a house sign created that contains the name of the house, Windsor")
    unassigned_project_2.client = client_2
    unassigned_project_2.client.organization = organization_2
    unassigned_project_2.save

    organization_3 = Organization.create(:name => "Duke Chamber Players", :description => "A small student run orchestra ensemble.")
    client_3 = Client.create(:first_name => "Ayana", :last_name => "Burkins", :email => "amb136@duke.edu", :department => "Undergraduate Student Organization", :cell => "3364099745")
    unassigned_project_3 = Project.create(:mediums => ["Small Flyer"], :kind => "print", :status => "unassigned", :due_date => Date.today, :details => "Something bright and festive, perhaps highlighting the specific pieces we are playing as well as the time and location of the event", :direction => "A festive holiday concert on December 7th. We want to attract Duke students to come see us perform")
    unassigned_project_3.client = client_3
    unassigned_project_3.client.organization = organization_3
    unassigned_project_3.save
  end
  def down
  end
end
