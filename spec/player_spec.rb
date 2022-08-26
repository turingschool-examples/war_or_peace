require 'rspec'
require 'card.rb'
require 'deck.rb'
require 'player.rb'

RSpec.describe Player do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new(card)
    player = Player.new('name', deck)

    expect(player).to be_an_instance_of(Player)
  end

  it "creates a player with a deck of multiple cards " do

    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card_1, card_2, card_3])
    player = Player.new('Clarisa', deck)

    expect(deck.cards.count).to eq(3)
    expect(player.name).to eq("Clarisa")
    expect(player.deck).to eq(deck)
  end

  it "checks if the player has lost" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    expect(player.deck).to eq(deck)

    player.has_lost?

    expect(player.has_lost?).to be false

    deck.remove_card
    player.has_lost?

    expect(player.deck.cards).to eq([card_2, card_3])
    expect(player.has_lost?).to be false

    deck.remove_card
    player.has_lost?

    expect(player.deck.cards).to eq([card_3])
    expect(player.has_lost?).to be false

    deck.remove_card
    player.has_lost?

    expect(player.deck.cards).to be_empty
    expect(player.has_lost?).to be true
  end
end
