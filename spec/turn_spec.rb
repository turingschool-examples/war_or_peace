require 'rspec'
require '../lib/deck'
require '../lib/card'
require '../lib/player'
require '../lib/turn'

RSpec.describe Player do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck1 = Deck.new([card1, card2, card3, card4])
    player1 = Player.new('Megan', deck1)
    expect(player1.name).to eq('Megan')
    expect(player1.deck).to eq(deck1)
  end

  it 'exists' do
    card5 = Card.new(:spade, '6', 6)
    card6 = Card.new(:club, 'Jack', 11)
    card7 = Card.new(:diamond, '10', 10)
    card8 = Card.new(:heart, '8', 8)
    cards = [card5, card6, card7, card8]
    deck2 = Deck.new([card5, card6, card7, card8])
    player2 = Player.new('Aurora', deck2)
    expect(player2.name).to eq('Aurora')
    expect(player2.deck).to eq(deck2)
  end

  xit 'type of turn' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck1 = Deck.new([card1, card2, card3, card4])
    player1 = Player.new('Megan', deck1)

    card5 = Card.new(:spade, '6', 6)
    card6 = Card.new(:club, 'Jack', 11)
    card7 = Card.new(:diamond, '10', 10)
    card8 = Card.new(:heart, '8', 8)
    cards = [card5, card6, card7, card8]
    deck2 = Deck.new([card5, card6, card7, card8])
    player2 = Player.new('Aurora', deck2)
    expect(turn.type).to eq(:basic)
  end
end
