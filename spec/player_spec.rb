require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

describe Player do
  it 'has a player' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.name).to eq('Clarisa')
    expect(player).to be_an_instance_of(Player)
  end



  it 'has lost?' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(true)
  end
end
