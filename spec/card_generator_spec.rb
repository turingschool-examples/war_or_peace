require 'pry'
require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require './lib/card_generator'

RSpec.describe CardGenerator do
  it "exists" do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    expect(cards).to be_an_instance_of(CardGenerator)
  end

  it "creates a deck of cards" do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    expect(cards[0].value).to eq('2')
    expect(cards[0].suit).to eq(:heart)
    expect(cards[0].rank).to eq(2)
  end
end
