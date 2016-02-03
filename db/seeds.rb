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


40.times do
  Pin.create(
    username: Faker::Name.first_name,
    user_id: Faker::Number.between(1, 10),
    song_id: Faker::Number.between(1, 10),
    comment: Faker::Hipster.sentences(1),
    song_artist: Faker::Name.name,
    song_title: Faker::Hipster.words
  )
end

melissa = User.create(first_name: "Melissa", last_name: "Etheridge", username: "onlyone", password: "window", email: "come2window@google.com", city: "Leavenworth", state: 'KS', avatar: File.open(File.join(Rails.root, "/app/assets/images/melissa.png")))
FriendRequest.create(recipient_id: 11, sender_id: 1, status: true)
FriendRequest.create(recipient_id: 11, sender_id: 2, status: true)
FriendRequest.create(recipient_id: 11, sender_id: 3, status: true)
FriendRequest.create(recipient_id: 11, sender_id: 4, status: true)
FriendRequest.create(recipient_id: 11, sender_id: 5, status: true)
FriendRequest.create(recipient_id: 11, sender_id: 6, status: true)
FriendRequest.create(recipient_id: 11, sender_id: 7, status: true)

Pin.create(user_id: 1, comment: "I really like this song, Go Cards!", song_id: "Hit Song", username: "Ricky Martin")
Pin.create(user_id: 2, comment: "This really gets me going", song_id: "Booty Dance", username: "Dan Davis")
Pin.create(user_id: 3, comment: "Heartland Rock is the best guyzz", song_id: "The Best Song Ever", username: "Ronald Regan")
Pin.create(user_id: 4, comment: "Remember this one, guys?", song_id: "Mambo Number 5", username: "Saucy Cat")
Pin.create(user_id: 5, comment: "A real heartstopper", song_id: "4 33", username: "Billy Ocean")
