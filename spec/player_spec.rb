require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require 'pry'

RSpec.describe Player do

  it "has the correct attributes" do
    deck = Deck.new([])
    player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
    expect(player.name).to eq "Clarisa"
    expect(player.deck).to eq deck
  end

  it "#has_lost? returns true when player deck has no cards in it" do
    deck = Deck.new([])
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to eq true
  end

  it "#has_lost? returns false if a player deck has cards in it" do
    card1 = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new([card1])
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to eq false
  end

  it "iteration 2" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player).to be_an_instance_of(Player)
      expect(player.name).to eq "Clarisa"
      expect(player.deck).to be_an_instance_of(Deck)
      expect(player.has_lost?).to eq false
      expect(player.deck.remove_card).to eq card1
      expect(player.has_lost?).to eq false
      expect(player.deck.remove_card).to eq card2
      expect(player.has_lost?).to eq false
      expect(player.deck.remove_card).to eq card3
      expect(player.has_lost?).to eq true
      expect(player.deck.cards).to eq []
  end

  # it "exists" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new([card1, card2, card3])
  #   player = Player.new('Clarisa', deck)
  #
  #   expect(player).to be_an_instance_of(Player)
  # end
  #
  # it "returns whether or not the player has lost" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new([card1, card2, card3])
  #   player = Player.new('Clarisa', deck)
  #
  #   expect(player.has_lost?).to eq false
  # end
  #
  # it "returns a removed card" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new([card1, card2, card3])
  #   player = Player.new('Clarisa', deck)
  #
  #   expect(player.deck.remove_card).to eq card1
  # end
  #
  # it "returns whether or not the player has lost" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new([card1, card2, card3])
  #   player = Player.new('Clarisa', deck)
  #   player.deck.remove_card
  #
  #   expect(player.has_lost?).to eq false
  # end
  #
  # it "returns a removed card" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new([card1, card2, card3])
  #   player = Player.new('Clarisa', deck)
  #   player.deck.remove_card
  #   expect(player.deck.remove_card).to eq card2
  # end
  #
  # it "returns whether or not the player has lost" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new([card1, card2, card3])
  #   player = Player.new('Clarisa', deck)
  #   player.deck.remove_card
  #   player.deck.remove_card
  #
  #   expect(player.has_lost?).to eq false
  # end
  #
  # it "returns a removed card" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new([card1, card2, card3])
  #   player = Player.new('Clarisa', deck)
  #   player.deck.remove_card
  #   player.deck.remove_card
  #
  #   expect(player.deck.remove_card).to eq card3
  # end
  #
  # it "returns whether or not the player has lost" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new([card1, card2, card3])
  #   player = Player.new('Clarisa', deck)
  #   player.deck.remove_card
  #   player.deck.remove_card
  #   player.deck.remove_card
  #   expect(player.has_lost?).to eq true
  # end

end
