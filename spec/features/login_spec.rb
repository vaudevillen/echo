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

feature 'Create A new User' do
  scenario "makes me a new user" do
    visit new_user_path
    fill_in 'First Name', :with => 'mike'
    fill_in 'Last Name', :with => 'Pearl'
    fill_in 'Email', :with => 'm@m.com'
    fill_in 'Password', :with => 'boomboom'
    fill_in 'Username', :with => 'mikeymike'
    fill_in 'City', :with => 'Chicago'
    click_button 'Create User'
    expect(page.current_path).to eq(new_user_path)
    expect(page).to have_content("State can't be blank")
  end
end

feature 'Your main page' do
  # Create a let to clean this up for consistancy
  context 'Check Button Features' do
    scenario "displays  a button to see your friends" do
      @penelope = User.create!(first_name: "Penelope", last_name: "Pearl", username: 'peneloperocks', email: "p@p.com", city: "Chicago", state: "IL", password: "boomboom")
      @mike = User.create!(first_name: "mike", last_name: "Pearl", username: 'mikeymike', email: "m@m.com", city: "Chicago", state: "IL", password: "boomboom")
      FriendRequest.create!(sender: @penelope, recipient: @mike, status: true)
      page.set_rack_session(:user_id => @penelope.id)
      visit '/maps'
      click_button "Friends"
      expect(page).to have_content('mike Pearl')
    end

    scenario 'displays a list of my profile features' do
      @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
      page.set_rack_session(:user_id => @michael.id)
      visit '/maps'
      find(".test-profile").click
      expect(page.current_path).to eq(user_path(@michael))
      expect(page).to have_content('2016')
    end
  end
end

  feature 'Profile Page and Settings' do

    context 'Check Button Functions'do
      scenario 'The user clicks a button to go back to the maps' do
        @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
        page.set_rack_session(:user_id => @michael.id)
        visit user_path(@michael)
        click_on('Map')
        expect(page.current_path).to eq(maps_path)
        expect(page).to have_content('recent_actors')
      end
    # end

    # context 'This goes to Spotify Login'do
      scenario 'The user clicks a button to login to spotify' do
        @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
        page.set_rack_session(:user_id => @michael.id)
        visit user_path(@michael)
        click_on('login-button')
        expect(page).to have_content('Spotify')
      end

      scenario 'The user clicks on the logout button to sign-out' do
        @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
        page.set_rack_session(:user_id => @michael.id)
        visit user_path(@michael)
        click_button 'Logout'
        expect(page.current_path).to eq('/')
        expect(page).to have_content('their memories')
      end

      scenario 'The user is able to check their account settings' do
        @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
        page.set_rack_session(:user_id => @michael.id)
        visit user_path(@michael)
        click_link("Account Settings")
        expect(page.current_path).to eq(edit_user_path(@michael))
        expect(page).to have_content('First Name')
      end

      scenario 'The users new information will be saved' do
        @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
        page.set_rack_session(:user_id => @michael.id)
        visit edit_user_path(@michael)
        click_on('Update User')
        expect(page).to have_current_path(user_path(@michael))
      end

      scenario 'The user can edit their recent pins' do
        @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
        @pin = Pin.create!(song_id: 29, user: @michael)
        page.set_rack_session(:user_id => @michael.id)
        visit user_path(@michael)
        click_on("Edit")
        expect(page).to have_current_path(edit_pin_path(@pin))
        expect(page).to have_content('Edit Echo')
      end


    end
  end
