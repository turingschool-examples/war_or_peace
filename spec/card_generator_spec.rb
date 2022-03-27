require 'rspec'
require './lib/card_generator'

describe CardGenerator do

  it "exists" do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards).to be_an_instance_of(CardGenerator)
  end

  it "creates array of card objects from text file on initialization" do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards.cards.length).to eq(52)
    expect(cards.cards[0]).to be_an_instance_of(Card)
  end
end
