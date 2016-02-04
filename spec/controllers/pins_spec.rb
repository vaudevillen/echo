require 'rails_helper'

  describe PinsController do
    let! (:mike) { User.create!(first_name: "mike", last_name: "j", username: 'mikey', email: "m@m.com", city: "Chicago", state: "IL", password: "tort")}
    let!(:pin) { {username: "mike j", song_artist: "fine young", song_title: "She drives me Crazy", song_id: 5, user_id: 5, latitude: 43, longitude: -81.3, comment: "this is just a test", address: "222"} }

    describe 'POST #create'do
      context 'when the user creates a new pin' do
        it 'Creates an new instance of a pin' do
          allow(controller).to receive(:authorize).and_return(true)
          allow(controller).to receive(:current_user).and_return(mike)
          expect { post :create, {username: "mike j", song_artist: "fine young", song_title: "She drives me Crazy", song_id: 5, latitude: 43, longitude: -81.3, comment: "this is just a test", address: "222"} }.to change { Pin.count }.by(1)
        end
      end
    end

  end
