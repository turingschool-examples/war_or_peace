require 'rspec'
require './lib/card'

RSpec.describe Card do
  before (:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card = Card.new(:heart, 'Jack', 11)
  end

  it "exists" do
    expect(@card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    expect(@card.suit).to eq(:heart)
    expect(@card.value).to eq('Jack')
    expect(@card.rank).to eq(11)
  end
end
