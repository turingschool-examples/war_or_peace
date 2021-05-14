require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
  end

  it 'has a name' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    expect(player.name).to eq('Clarisa')
  end

  it 'has a deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    expect(player.deck).to eq(deck)
  end

  #before(:each) <== Look in testing notes (variables need to be instance variables)

  it 'has lost?' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    player.has_lost?

    expect(player.has_lost?).to eq(false)
  end

  it 'has lost?' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    player.deck.remove_card

    player.has_lost?

    expect(player.has_lost?).to eq(false)
  end

  it 'has lost?' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    player.deck.remove_card
    player.deck.remove_card

    player.has_lost?

    expect(player.has_lost?).to eq(false)
  end

  it 'has lost?' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card


    player.has_lost?

    expect(player.has_lost?).to eq(true)
  end

end
