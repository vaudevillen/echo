require 'rails_helper'

feature 'Your main page' do
  let(:penelope) { User.create!(first_name: "Penelope", last_name: "Pearl", username: 'peneloperocks', email: "p@p.com", city: "Chicago", state: "IL", password: "boomboom") }
  let(:mike) { User.create!(first_name: "mike", last_name: "Pearl", username: 'mikeymike', email: "m@m.com", city: "Chicago", state: "IL", password: "boomboom") }

  context 'Check Users Features' do
    scenario "displays  a button to see your friends" do
      FriendRequest.create!(sender: penelope, recipient: mike, status: true)
      page.set_rack_session(:user_id => penelope.id)
      visit '/maps'
      click_button "Friends"
      expect(page).to have_content('mike Pearl')
    end

    scenario 'displays a list of my profile features' do
      page.set_rack_session(:user_id => mike.id)
      visit '/maps'
      find(".test-profile").click
      expect(page.current_path).to eq(user_path(mike))
      expect(page).to have_content('2016')
    end

      scenario 'The user clicks a button to go back to the maps' do
        page.set_rack_session(:user_id => mike.id)
        visit user_path(mike)
        click_on('Map')
        expect(page.current_path).to eq(maps_path)
        expect(page).to have_content('person_pin')
      end

      scenario 'The user clicks a button to go back to login to Spotify' do
        page.set_rack_session(:user_id => mike.id)
        visit edit_user_path(mike)
        click_on('login-button')
        expect(page).to have_content('Spotify')
      end

      scenario 'The user clicks on the logout button to sign-out' do
        page.set_rack_session(:user_id => mike.id)
        visit user_path(mike)
        click_button 'Logout'
        expect(page.current_path).to eq('/')
        expect(page).to have_content('their memories')
      end

      scenario 'The user is able to check their account settings' do
        page.set_rack_session(:user_id => mike.id)
        visit user_path(mike)
        click_link("Account Settings")
        expect(page.current_path).to eq(edit_user_path(mike))
        expect(page).to have_content('First Name')
      end

      scenario 'The users new information will be saved' do
        page.set_rack_session(:user_id => mike.id)
        visit edit_user_path(mike)
        click_on('Update User')
        expect(page).to have_current_path(user_path(mike))
      end
    end
  end
