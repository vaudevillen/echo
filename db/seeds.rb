# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

states = [{:name=>"AL"}, {:name=>"AK"}, {:name=>"AZ"}, {:name=>"AR"}, {:name=>"CA"}, {:name=>"CO"}, {:name=>"CT"}, {:name=>"DE"}, {:name=>"DC"}, {:name=>"FL"}, {:name=>"GA"}, {:name=>"HI"}, {:name=>"ID"}, {:name=>"IL"}, {:name=>"IN"}, {:name=>"IA"}, {:name=>"KS"}, {:name=>"KY"}, {:name=>"LA"}, {:name=>"ME"}, {:name=>"MD"}, {:name=>"MA"}, {:name=>"MI"}, {:name=>"MN"}, {:name=>"MS"}, {:name=>"MO"}, {:name=>"MT"}, {:name=>"NE"}, {:name=>"NV"}, {:name=>"NH"}, {:name=>"NJ"}, {:name=>"NM"}, {:name=>"NY"}, {:name=>"NC"}, {:name=>"ND"}, {:name=>"OH"}, {:name=>"OK"}, {:name=>"OR"}, {:name=>"PA"}, {:name=>"RI"}, {:name=>"SC"}, {:name=>"SD"}, {:name=>"TN"}, {:name=>"TX"}, {:name=>"UT"}, {:name=>"VT"}, {:name=>"VA"}, {:name=>"WA"}, {:name=>"WV"}, {:name=>"WI"}, {:name=>"WY"}]

states.each do |state|
State.create(state)
end

10.times do
     User.create(
        email: Faker::Internet.email,
        password_digest: Faker::Internet.password,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.user_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        avatar: File.open(File.join(Rails.root, "/app/assets/images/stick.png"))
      )
end

30.times do
  Pin.create(
    username: Faker::Name.first_name,
    user_id: Faker::Number.between(1, 10),
    song_id: Faker::Number.between(1, 10),
    comment: Faker::Hipster.sentences(1),
    song_artist: Faker::Name.name,
    song_title: Faker::Hipster.words
  )
end

will = User.create(first_name: 'Will', last_name: 'Granger', username: 'GrangerousTimes', password: 'dachshund', email: "twgranger@gmail.com", city: "Chicago", state: "IL", avatar: URI.parse('https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/8/005/036/258/01e168f.jpg'))
# Pin.create(user_id: will.id, song_id: "35w541m4SS6eqKFHmFNu47", comment: "My first show in Chicago!", address: "2100 W Belmont Ave, Chicago, IL 60618, USA", username: "Will Granger", created_at: "2016-02-04 20:46:29", updated_at: "2016-02-04 20:46:29", song_artist: "Nobunny", song_title: "Gone For Good")
# Pin.create(user_id: will.id, song_id: "7ah8dRCjJFGCWstleG0PpD", comment: "KKill a Punk for Rock and Roll. This was the first line I noticed on the cover of 'Popular Favorites,' and each time I listen to the record reminds me of the four hour trip from Birmingham to Memphis to see their reunion in 2008. We wouldn't make it back to Birmingham until after 4am and a close call at an ATM when we almost got robbed. The Oblivians made the trip up north to play a New Year's Eve show, and I was able to walk home at midnight without any late-night trips to an ATM.", address: "1035 N Western Ave, Chicago, IL 60622, USA", username: "Will Granger", created_at: "2016-02-04 21:02:39", updated_at: "2016-02-04 21:02:39", song_artist: "Oblivians", song_title: "Christina")
# Pin.create(user_id: will.id, song_id: "4FMNpPI7mkhdeFCCk6fZiE", comment: "'Borderline' is the sound of taking the metro home late at night while smiling and dancing with yourself. You can be a little drunk, and passengers can make their own assumptions about what's going on in your world.", address: "100 W Randolph St, Chicago, IL 60601, USA", username: "Will Granger", created_at: "2016-02-04 21:06:37", updated_at: "2016-02-04 21:06:37", song_artist: "Madonna", song_title: "Borderline")
# Pin.create(user_id: will.id, song_id: "6jzbUvXYVbH6NrUS3WRMoL", comment: "Fela's records had been out of print for years until they were finally reissued by Knitting Factory. With that, the resurgence of Afro-beat came back. I was a bit hesitant about moving to Chicago on a whim in 2015, but after finding this is the world section of a local record store, I decided I'd find my place in a new city.", address: "1379 N Milwaukee Ave, Chicago, IL 60622, USA", username: "Will Granger", created_at: "2016-02-04 21:11:03", updated_at: "2016-02-04 21:11:03", song_artist: "Fela Kuti", song_title: "Water No Get Enemy")
# Pin.create(user_id: will.id, song_id: "2mWC65WOZSBZnaacXaYoBR", comment: "One day, when money isn't so tight, I'm going to step into a bar and play 'Cowboy Song' twenty times on a jukebox. I haven't decided if I will stay or not, but I'm curious how long it would take people to notice what's happening.", address: "222 W Kinzie St, Chicago, IL 60654, USA", username: "Will Granger", created_at: "2016-02-04 21:18:03", updated_at: "2016-02-04 21:18:03", song_artist: "Thin Lizzy", song_title: "Cowboy Song")

melissa = User.create(first_name: "Melissa", last_name: "Etheridge", username: "onlyone", password: "window", email: "come2window@google.com", city: "Leavenworth", state: 'KS', avatar: File.open(File.join(Rails.root, "/app/assets/images/melissa.png")))
FriendRequest.create(recipient_id: 12, sender_id: 1, status: true)
FriendRequest.create(recipient_id: 12, sender_id: 2, status: true)
FriendRequest.create(recipient_id: 12, sender_id: 3, status: true)
FriendRequest.create(recipient_id: 12, sender_id: 4, status: true)
FriendRequest.create(recipient_id: 12, sender_id: 5, status: true)
FriendRequest.create(recipient_id: 12, sender_id: 6, status: true)
FriendRequest.create(recipient_id: 12, sender_id: 7, status: true)
FriendRequest.create(recipient_id: 12, sender_id: 11, status: true)

Pin.create(user_id: 1, comment: "I really like this song, Go Cards!", song_id: "Hit Song", username: "Ricky Martin")
Pin.create(user_id: 2, comment: "This really gets me going", song_id: "Booty Dance", username: "Dan Davis")
Pin.create(user_id: 3, comment: "Heartland Rock is the best guyzz", song_id: "The Best Song Ever", username: "Ronald Regan")
Pin.create(user_id: 4, comment: "Remember this one, guys?", song_id: "Mambo Number 5", username: "Saucy Cat")
Pin.create(user_id: 5, comment: "A real heartstopper", song_id: "4 33", username: "Billy Ocean")
