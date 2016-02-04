require 'rails_helper'

describe User do
  before(:all) do
    @person = User.new(id: 2)
    @friend = User.new(id: 3)
    @request = FriendRequest.new(sender_id: @friend.id, recipient_id: @person.id, status: true)
  end

  let(:user) { FactoryGirl.build(:user) }
  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it "has a username" do
    expect(user.username).to be_a(String)
  end

  it 'has a firstname' do
    expect(user.first_name).to eq('John')
  end

  it 'has a lastname' do
    expect(user.last_name).to eq('Doe')
  end

  it 'has an email' do
    expect(user.email).to eq("hitandrun@pauline.com")
  end

  it 'has a password' do
    expect(user.password).to eq('soulkitchen')
  end

  it 'can create a fullname' do
    expect(user.fullname).to eq('John Doe')
  end

  it 'returns friends' do
    expect(user.friends).to be_an(Array)
  end

  it 'has a location' do
    expect(user.location).to eq('Los Angeles, CA')
  end

  it 'has a state' do
    expect(user.state).to eq('CA')
  end

  it 'can return two recent pins of friends' do
    expect(user.recent_pins).to be_an(Array)
  end

end