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

