require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'



RSpec.describe Player do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array = [card1, card2, card3]
    deck = Deck.new(card_array)


    player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(Player)
  end

  it 'gets the name attribute' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array = [card1, card2, card3]
    deck = Deck.new(card_array)


    player = Player.new('Clarisa', deck)
    expect(player.name).to eq('Clarisa')
  end

  it 'gets the deck attribute' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array = [card1, card2, card3]
    deck = Deck.new(card_array)


    player = Player.new('Clarisa', deck)
    expect(player.deck).to eq(deck)
  end

  it 'checks if the player has lost' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array = [card1, card2, card3]
    deck = Deck.new(card_array)


    player = Player.new('Clarisa', deck)
    expect(player.has_lost?).to eq(false)
  end

  it 'removes a card from the players deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array = [card1, card2, card3]
    deck = Deck.new(card_array)


    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card
    expect(player.deck.cards).to eq([])
  end


end
