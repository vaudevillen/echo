require 'rails_helper'

feature 'login' do
  it "should have a login button on the front page" do
    visit '/'
    expect(page).to have_button "Login"
  end

  click_button "Login"
  screenshot_and_open_image
end
