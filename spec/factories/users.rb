FactoryGirl.define do
  factory :user do |f|
    f.first_name "John"
    f.last_name  "Doe"
    f.email "hitandrun@pauline.com"
    f.username Faker::Internet.user_name
    f.password "soulkitchen"
    f.state "CA"
    f.city "Los Angeles"
  end
end