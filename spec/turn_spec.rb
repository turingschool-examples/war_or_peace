require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  it "Turn Class test" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    expect(turn).to be_an_instance_of(Turn)
  end
