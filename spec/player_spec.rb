require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarissa', deck)
    expect(player).to be_an_instance_of Player
  end
end


describe 'has lost?' do
  it 'returns true or false' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarissa', deck)
    expect(player.has_lost?).to eq false
    player.deck.remove_card(card1)
    player.deck.remove_card(card2)
    player.deck.remove_card(card3)
    player.deck.remove_card(card4)
    expect(player.has_lost?).to eq true
  end
end
