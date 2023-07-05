require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do 
  it 'exists with attributes' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(card1).to be_a(Card)
    expect(card2).to be_a(Card)
    expect(card3).to be_a(Card)
    expect(deck).to be_a(Deck)
    expect(player).to be_a(Player)

    expect(player.name).to eq("Clarisa")
    expect(player.deck).to eq(deck)
    expect(player.has_lost?).to eq(false) 
  end 

  it 'goes through deck to check win or loss' do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.deck).to eq(deck)
    expect(player.has_lost?).to eq(false) 
    player.deck.remove_card
    expect(player.has_lost?).to eq(false) 
    player.deck.remove_card
    expect(player.has_lost?).to eq(false) 
    player.deck.remove_card
    expect(player.has_lost?).to eq(true) 
    expect(player.deck).to eq(deck)
  end
end