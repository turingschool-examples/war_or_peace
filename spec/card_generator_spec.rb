require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

describe CardGenerator do

  it "exists" do

    card_generator = CardGenerator.new("cards.txt")

    expect(card_generator).to be_an_instance_of(CardGenerator)
    # require 'pry'; binding.pry
  end

  it "uploads the cards" do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    expect(cards.length).to eq(52)

  end



end
