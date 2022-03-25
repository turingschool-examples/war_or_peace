require './lib/player'

describe Player do
  it "has players" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
    expect(player.name).to eq('Clarisa')
  end

  it "has a deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
    expect(player.deck).to be_an_instance_of(Deck)
  end

  it "check for a loss" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    card5 = Card.new(:spade, 'Ace', 14)
    card6 = Card.new(:club, '6', 6)

    cards1 = [card1, card2, card3]
    cards2 = [card4, card5, card6]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Bob', deck1)
    player2 = Player.new('Ruby', deck2)
    expect(player1.has_lost?).to be false
  end
end
