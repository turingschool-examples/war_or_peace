require './lib/player.rb'
require './lib/deck.rb'
require './lib/card.rb'
require 'rspec'
require 'pry'

RSpec.describe 'test functionality of player class' do

  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
  end

  it "has a 'name' method to return the player's name" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    expect(player.name).to eq('Clarisa')
  end

  it "has a 'deck' method to return the player's deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    expect(player.deck).to eq(deck)
  end

  it "has a method 'has_lost?' returning True if player's deck is empty" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to eq(false)

    player.deck.remove_card
#binding.pry
    expect(player.has_lost?).to eq(false)

    player.deck.remove_card
#binding.pry
    expect(player.has_lost?).to eq(false)

    player.deck.remove_card
#binding.pry
    expect(player.has_lost?).to eq(true)
  end
end
