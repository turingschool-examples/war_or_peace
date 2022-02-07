require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(Player)
  end

  it "can return the player name" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(Player)
    expect(player.name).to eq('Clarisa')
  end

  it "can return the player deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(Player)
    expect(player.deck).to eq(deck)
  end

  it "can tell if a player #has_lost?" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)
    expect(player.has_lost?).to eq(false)
   end

   it "can remove a card from the deck" do
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)
     card4 = Card.new(:heart, 'King', 13)

     cards = [card1, card2, card3, card4]
     deck = Deck.new(cards)

     player = Player.new('Clarisa', deck)
     player.deck.remove_card
     expect(player.has_lost?).to eq(false)
     player.deck.remove_card
     expect(player.has_lost?).to eq(true)
   end
end
