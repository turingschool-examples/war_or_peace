require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
require 'CSV'

describe CardGenerator do

  it "exists" do

    card_generator = CardGenerator.new("cards.txt")

    expect(card_generator).to be_an_instance_of(CardGenerator)
    # require 'pry'; binding.pry
  end

  it "uploads the cards" do
    # require 'pry'; binding.pry
    @filename = "cards.txt"
    # require 'pry'; binding.pry
    deck = CardGenerator.new(@filename)
    # require 'pry'; binding.pry
    tester_deck = deck.generate_cards

    # require 'pry'; binding.pry
    expect(tester_deck.cards.length).to eq(52)

  end



end
