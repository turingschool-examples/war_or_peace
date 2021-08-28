require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1,@card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

    it "exists" do
      expect(@player).to be_a(Player)
    end

    it "player has a name" do
      expect(@player.name).to eq("Clarisa")
    end

    it "player has a deck" do
      expect(@player.deck).to eq(@deck)
    end

    it "player has lost when the deck array is empty" do
      expect(@player.has_lost?).to eq(false)
    end

    it ""
end
