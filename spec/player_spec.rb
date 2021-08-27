require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player).to be_a(Player)
  end

  it 'has attributes' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.name).to eq("Clarisa")
    expect(player.deck).to eq(deck)
  end

  it 'does not lose immediately' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to eq(false)
  end

  it '' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    results = [card1, card2, card3]
    expect(deck.cards).to eq(results)

    player.deck.remove_card

    results = [card2, card3]
    expect(deck.cards).to eq(results)
    expect(player.has_lost?).to eq(false)

    player.deck.remove_card

    results = [card3]
    expect(deck.cards).to eq(results)
    expect(player.has_lost?).to eq(false)

    player.deck.remove_card

    results = []
    expect(deck.cards).to eq(results)
    expect(player.has_lost?).to eq(true)
    expect(player.deck).to eq(deck)
  end
end


# player.deck
# #=> #<Deck:0x007f9cc396bdf8 @cards=[]>
