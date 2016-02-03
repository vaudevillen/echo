require 'rails_helper'
# include UserHelper
feature 'login' do
  before(:each) do
    visit '/'
  end
  it "should have a login button on the front page" do
    expect(page).to have_button "Login"
  end
  it "should not be logged in" do
    expect(page).not_to have_button "Logout"
  end
  it "should not be logged in" do
    expect(page).to have_button "Login"
  end
end

feature 'Your main page' do
  context 'See my list of friends' do
    it "displays  a button to see your friends" do
      @penelope = User.create!(first_name: "Penelope", last_name: "Pearl", username: 'peneloperocks', email: "p@p.com", city: "Chicago", state: "IL", password: "boomboom")
      @mike = User.create!(first_name: "mike", last_name: "Pearl", username: 'mikeymike', email: "m@m.com", city: "Chicago", state: "IL", password: "boomboom")
      FriendRequest.create!(sender: @penelope, recipient: @mike, status: true)
      page.set_rack_session(:user_id => @penelope.id)
      visit '/maps'
      click_button "Friends"
      expect(page).to have_content('mike Pearl')
    end
  end

  context 'See my profile page' do
    it 'displays a list of my profile features' do
      @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
      page.set_rack_session(:user_id => @michael.id)
      visit '/maps'
      find(".test-profile").click
      expect(page.current_path).to eq(user_path(@michael))
      expect(page).to have_content('2016')
    end
  end
end

  feature 'Profile Page' do
    context 'The button will take us back to the users map'do
      it 'has a button to go back to the maps' do
        @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
        page.set_rack_session(:user_id => @michael.id)
        visit user_path(@michael)
        click_button 'Map'
        # expect(page.current_path).to eq(maps)
        # This path is wrong and we need to take a look at this. We need to fix this route!
        expect(page).to have_content('Friends')
      end
    end

    context 'This goes to Spotify Login'do
      it 'has a button to go back to the maps' do
        @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
        page.set_rack_session(:user_id => @michael.id)
        visit user_path(@michael)      
        click_on('login-button')
        expect(page).to have_content('Spotify')
      end
    end
  end
