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