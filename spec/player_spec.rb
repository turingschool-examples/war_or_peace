require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  let(:card1) { Card.new(:diamond, 'Queen', 12) }
  let(:card2) { Card.new(:spade, '3', 3) }
  let(:card3) { Card.new(:heart, 'Ace', 14) }
  let(:card4) { Card.new(:club, '5', 5) }
  let(:deck) { Deck.new([card1, card2, card3]) }
  let(:player) { Player.new('Clarisa', deck) }

  it 'should have a class that exists and have a name and deck attribute' do
    expect(player).to be_a Player
    expect(player.name).to eq ("Clarisa")
    expect(player.deck).to eq (deck)
  end

  it 'should inform if a player lost' do
    expect(player.has_lost?).to eq false
    player.deck.remove_card
    expect(player.deck.cards.count).to eq 2
    expect(player.has_lost?).to eq false
    player.deck.remove_card
    expect(player.has_lost?).to eq false
    player.deck.remove_card
    expect(player.has_lost?).to eq true
    expect(player.deck).to eq(deck)
  end
end