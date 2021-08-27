require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

describe Turn do

  describe "#initialize" do
    it "creates an instance of class Turn" do
      card1 = Card.new(:spade, '3', 3)
      card2 = Card.new(:diamonds, 'king', 13)
      card3 = Card.new(:clubs, '8', 8)
      card4 = Card.new(:spades, '5', 5)
      cards1 = [card1, card2]
      cards2 = [card3, card4]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new("Jacob", deck1)
      player2 = Player.new("Bacoj", deck2)
      turn1 = Turn.new(player1, player2)

      expect(turn1).to be_an_instance_of(Turn)
    end
  end

end
