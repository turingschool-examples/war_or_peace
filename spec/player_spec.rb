require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("Clarisa", deck)

    expect(player).to be_an_instance_of Player
    expect(player.name).to eq("Clarisa")
  end

  it "has a deck of cards" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("Clarisa", deck)

    expect(player.deck).to eq(deck)
  end

  it "has not lost before playing" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("Clarisa", deck)

    expect(player.has_lost?).to be false
  end

  it "can remove a card" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("Clarisa", deck)

    player.deck.remove_card
    expect(player.has_lost?).to be false
  end

  it "has lost when all cards are gone" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new("Clarisa", deck)

    player.deck.remove_card
    expect(player.has_lost?).to be false

    2.times do
      player.deck.remove_card
    end
    expect(player.has_lost?).to be true
    expect(player.deck.cards.count).to eq(0)
    expect(player.deck.cards).to eq([])
  end
end
