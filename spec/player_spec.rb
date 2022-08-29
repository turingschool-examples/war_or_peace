require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it 'exists' do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2, card_3])
    player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
  end

  it 'can have a name' do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2, card_3])
    player = Player.new('Clarisa', deck)

    expect(player.name).to eq('Clarisa')
  end

  it 'has a deck' do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2, card_3])
    player = Player.new('Clarisa', deck)

    expect(player.deck).to eq(deck)
  end

  it 'can loose a game' do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, 'Three', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2, card_3])
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to be(false)
    player.deck.remove_card
    expect(player.has_lost?).to be(false)
    player.deck.remove_card
    expect(player.has_lost?).to be(false)
    expect(player.deck.card_list.length).to eq(1)
    expect(player.deck.card_list[0]).to eq(card_3)
    player.deck.remove_card
    expect(player.has_lost?).to be(true)
    expect(player.deck.card_list).to eq([])
  end
end