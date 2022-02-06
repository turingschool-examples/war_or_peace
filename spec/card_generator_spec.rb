require 'rspec'
require './lib/card'
require './lib/card_generator'

RSpec.describe CardGenerator do
  it "exists" do
    filename = "cards.txt"
    create_deck = CardGenerator.new(filename)

    expect(create_deck).to be_an_instance_of(CardGenerator)
  end

  it "has has cards" do
    create_deck = CardGenerator.new(filename)
    cards = CardGenerator.new(filename).cards

    expect(cards.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end
end
