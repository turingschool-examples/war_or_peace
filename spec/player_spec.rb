require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

describe Player do

  describe "#initialize" do
    it "is an instance of Player" do
      card1 = Card.new(:spade, '3', 3)
      card2 = Card.new(:diamonds, 'king', 13)
      cards = [card1, card2]
      deck1 = Deck.new(cards)
      player1 = Player.new("Jacob", deck1)

      expect(player1).to be_an_instance_of(Player)
    end
  end

end
