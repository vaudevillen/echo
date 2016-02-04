require 'rails_helper'

describe SessionsController do
  let! (:mike) { User.create!(first_name: "mike", last_name: "j", username: 'mikey', email: "m@m.com", city: "Chicago", state: "IL", password: "tort")
  }
  let!(:user) { User.find_by(username: "mikey") }

  describe "POST #create" do
    context 'When the users info is valid' do
      it "Creates a new session for a user" do
        post(:create, username: "mikey", password: "tort")
        expect(session[:user_id]).to eq(mike.id)
      end
    end
    context 'When the users info is invalid' do
      it 're-renders the login page with error' do
        post(:create, username: "mikey", password: "badpassword")

        expect(response).to redirect_to("/login")
        expect(flash[:error]).to match("Your username and password do not match")
      end
    end

  end


end
