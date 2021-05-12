require 'rspec'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/player'

RSpec.describe Player do
  it 'initializes correctly' do
    not_ready_to_play = Player.new
    expect(not_ready_to_play.name).to eq('John')
    expect(not_ready_to_play.deck.cards).to eq([])
    expect(not_ready_to_play.has_lost?).to be(true)


    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    ready_to_play = Player.new('Clarissa', Deck.new([card1, card2, card3]))

    expect(ready_to_play.name).to eq('Clarissa')
    expect(ready_to_play.has_lost?).to be(false)

    expect(ready_to_play.deck.cards.length).to eq(3)

    expect(ready_to_play.deck.cards[0].suit).to eq(:diamond)
    expect(ready_to_play.deck.cards[0].value).to eq('Queen')
    expect(ready_to_play.deck.cards[0].rank).to eq(12)

    expect(ready_to_play.deck.cards[1].suit).to eq(:spade)
    expect(ready_to_play.deck.cards[1].value).to eq('3')
    expect(ready_to_play.deck.cards[1].rank).to eq(3)

    expect(ready_to_play.deck.cards[2].suit).to eq(:heart)
    expect(ready_to_play.deck.cards[2].value).to eq('Ace')
    expect(ready_to_play.deck.cards[2].rank).to eq(14)
  end

  it 'can lose a game when the deck is emptied' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    player = Player.new('Clarissa', Deck.new([card1, card2, card3]))

    expect(player.deck.cards.length).to eq(3)
    expect(player.has_lost?).to be(false)

    player.deck.remove_card
    expect(player.deck.cards.length).to eq(2)
    expect(player.has_lost?).to be(false)

    player.deck.remove_card
    expect(player.deck.cards.length).to eq(1)
    expect(player.has_lost?).to be(false)

    player.deck.remove_card
    expect(player.deck.cards.length).to eq(0)
    expect(player.has_lost?).to be(true)
  end
end
