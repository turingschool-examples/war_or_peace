require 'rspec'
# require 'pry'
require './lib/card'


RSpec.describe Card do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)

    expect(card1).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end

  it "can be different" do
    card = Card.new(:heart, 'Jack', 11)

  expect(card).to be_an_instance_of(Card)
  end


end
