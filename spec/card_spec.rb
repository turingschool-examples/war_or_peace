require 'rspec'
require 'pry'
require './lib/card'

RSpec.describe Card do
  it "exists" do
    card = Card.new(:heart, 'Jack', 11)

    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:heart, 'Jack', 11)

    expect(card.suit).to eq(:heart)
    expect(card.value).to eq('Jack')
    expect(card.rank).to eq(11)
  end
end