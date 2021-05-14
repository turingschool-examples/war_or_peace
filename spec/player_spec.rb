require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

RSpec.describe Player do
  it "is and instance of player" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
  end

  it 'has a deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)

    expect(player.deck).to eq(deck)

  end

  it 'knows if it lost' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to be(false)

    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card

    expect(player.has_lost?).to be(true)

  end

end
