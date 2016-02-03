require 'rails_helper'


describe 'State' do
  let(:state) {FactoryGirl.build(:state)}
  it 'has a valid factory' do
    expect(state).to be_valid
  end

  it "has a name" do
    expect(state.name).to eq("AL")
  end

end