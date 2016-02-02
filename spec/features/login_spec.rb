require 'rails_helper'
include UserHelper
feature 'login', js: true do
  before(:each) do
    visit '/'
  end
  # it "should have a login button on the front page" do
  #   expect(page).to have_button "Login"
  # end
  # it "should not be logged in" do
  #   expect(page).not_to have_button "Logout"
  # end
  # it "should create a new user when I register" do
  #   register('onlyone', 'window')

  # end
  # xit "should log in when given a correct username and password" do
  #   login('onlyone', 'window')
  #   expect(page).to have_css 'input[value=Logout]'
  # end
end
