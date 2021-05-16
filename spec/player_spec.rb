require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarissa', deck)

    expect(player).to be_an_instance_of(Player)
  end

  it "has name" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarissa', deck)

    expect(player.name).to eq('Clarissa')
  end

  it "has deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarissa', deck)

    expect(player.deck).to eq(deck)
  end

  it "can lose" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarissa', deck)

    expect(player.has_lost?).to eq(false)
    expect(player.deck.remove_card).to eq(card1)
    expect(player.has_lost?).to eq(false)
    expect(player.deck.remove_card).to eq(card2)
    expect(player.has_lost?).to eq(false)
    expect(player.deck.remove_card).to eq(card3)
    expect(player.has_lost?).to eq(true)
    expect(player.deck).to eq(deck)
  end



end
