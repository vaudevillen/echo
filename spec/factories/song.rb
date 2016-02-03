FactoryGirl.define do
  factory :song do |f|
    f.pins {|p| [p.association(:pin)]}
    f.title "Proud Mary"
    f.artist  "CCR"
    f.album "Bayou Country"
    f.year 1969
  end
end
