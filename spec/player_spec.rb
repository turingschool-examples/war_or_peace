require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heard, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(Player)
  end

  it "has a name" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heard, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

   expect(player.name).to eq('Clarisa')
  end

  it "has a deck" do
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heard, 'Ace', 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)
     player = Player.new('Clarisa', deck)

     expect(player.deck).to be_an_instance_of(Deck)
     expect(player.deck).to eq(deck)

  end

  it "has win or lost eval " do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heard, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to eq(false)
  end

  it "has remove a card " do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heard, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)

      player.deck.remove_card
      expect(player.deck.cards.length).to eq(2)
  end
  it "has_lost? works with empty deck" do

      card1 = Card.new(:diamond, 'Queen', 12)
      deck = Deck.new([card1])
      player = Player.new('Clarisa', deck)
      player.deck.remove_card
      expect(player.has_lost?).to eq(true)
  end

end
