require 'rspec'
require './lib/card'

RSpec.describe Card do

  it "exists" do
    card = Card.new(:heart, 'Jack', 11)
    expect(card).to be_an_instance_of(Card)
  end

  it "card.suit should return :heart" do
    card = Card.new(:heart, 'Jack', 11)
    expect(card.suit).to eq(:heart)
  end

  it "card.value should return 'Jack''" do
    card = Card.new(:heart, 'Jack', 11)
    expect(card.value).to eq('Jack')
  end

  it "card.rank should return 11" do
    card = Card.new(:heart, 'Jack', 11)
    expect(card.rank).to eq(11)
  end
end

