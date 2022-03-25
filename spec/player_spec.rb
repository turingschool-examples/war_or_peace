require 'rspec'
require './lib/player'
require './lib/card'
require './lib/deck'
require 'pry'

describe Player do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    name = "Clarisa"
    player1 = Player.new(name, deck)


    expect(player1).to be_an_instance_of(Player)

  end

  it "has a deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    name = "Clarisa"
    player1 = Player.new(name, deck)

    expect(player1.deck).to be_an_instance_of(Deck)
  end

  it "checks to see if player lost" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    name = "Clarisa"
    player1 = Player.new(name, deck)

    expect(player1.has_lost?).to eq(false)


  end

  it "checks to see if player won" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    name = "Clarisa"

    # 3.times do 
    #   deck = deck.remove_card
    #   return deck
    # end
    player1 = Player.new(name, deck)


    expect(player1.has_lost?).to eq(false)

  end


end
