FactoryGirl.define do
  factory :song do |f|
    f.title "Proud Mary"
    f.artist  "CCR"
    f.album "Bayou Country"
    f.year 1969
  end
end

FactoryGirl.define do
  factory :song_with_pin do
    after(:create) do |song|
      create(:pin, song: song)
    end
  end