require 'rspec'
require './lib/card'

RSpec.describe Card do
  before (:each) do
    @card1 = Card.new(:heart, 'Jack', 11)
  end

  it "exists" do
    expect(@card1).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    expect(@card1.suit).to eq(:heart)
    expect(@card1.value).to eq('Jack')
    expect(@card1.rank).to eq(11)
  end
end
