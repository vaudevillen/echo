require 'rails_helper'


describe 'Song' do
  let(:pinned) {FactoryGirl.create(:song_with_pin)}
  let(:song) {FactoryGirl.create(:song)}
  it 'has a valid factory' do
    expect(song).to be_valid
  end

  it "has an artist" do
    expect(song.artist).to eq("CCR")
  end

  it "has a title" do
    expect(song.title).to eq("Proud Mary")
  end

  it "has a year" do
    expect(song.year).to eq(1969)
  end

  it "has an album" do
    expect(song.album).to eq("Bayou Country")
  end

  it "has a pin" do
    expect(pinned.song).to eq(song)
  end

end