require "./card"
require "./deck"
require "./player"

RSpec.describe Player do
  it "creates new player" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    player_1 = Player.new("Michael", deck)

    expect(player_1.name).to eq("Michael")
  end

  it "checks when a player has lost" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player_1 = Player.new("Michael", deck)

    expect(player_1.has_lost?).to be(false)
    deck.remove_card
    expect(player_1.has_lost?).to be(false)
    deck.remove_card
    expect(player_1.has_lost?).to be(false)
    deck.remove_card
    expect(player_1.has_lost?).to be(true)

    expect(player_1.deck).to eq(deck)
  end
end