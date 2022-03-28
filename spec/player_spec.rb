require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "exists" do

    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck) # first initialize to guarantee an existance of player object
  end

  it "has name and deck name attributes" do

    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck) # initialize a player clarisa with name and deck
    expect(player.name).to eq('Clarisa') # checks for player objects name
    expect(player.deck).to eq(deck) # checks if player object clarisa has deck
  end

  it "has not lost" do

    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)
    # player.has_lost?(true)
    expect(player.has_lost?).to eq(false) # checks if has lost returns a false value
  end

  it "removed card" do

    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)
    deck.remove_card # the deck object which contains 3 card arrays will not dump 1 card array
    expect(deck.cards).to eq([card2, card3]) # the remaining card arrays left will be 2 and 3
  end

end
