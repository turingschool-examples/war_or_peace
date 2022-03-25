require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/player.rb'
require 'pry'

RSpec.describe Player do

  context "my tests" do

    it "exists and has a name" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Caden', deck)

      expect(player.name).to eq("Caden")
    end

    it "exists and has a deck" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Caden', deck)

      expect(player.deck).to eq(deck)
    end

    it "can determine if it lost the game" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Caden', deck)

      expect(player.has_lost?).to eq(false)
    end

    it "can remove cards and determine a loss" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Caden', deck)
      player.deck.remove_card
      player.deck.remove_card
      player.deck.remove_card
      expect(player.has_lost?).to eq true
    end

    it "can determine if "
  end
  context "interaction pattern" do
  end
end
