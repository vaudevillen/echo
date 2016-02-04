require 'rails_helper'

  feature 'Create a Pin' do
    scenario 'update a pin and redirect' do
        @michael = User.create!(first_name: "Michael", last_name: "Pearl", username: 'mjas', email: "m@p.com", city: "Chicago", state: "IL", password: "boomboom")
        page.set_rack_session(:user_id => @michael.id)
        visit new_pin_path
        fill_in 'pin_comment', :with => 'Great song'
        click_button 'Create Pin'
        expect(page).to have_content('New')
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
