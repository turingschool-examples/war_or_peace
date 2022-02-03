require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "Player Class test" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
  end

  it "player.name test" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
    player.name

    expect(player.name).to eq("Clarisa")
  end

  it "player.deck test " do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
    player.name

    expect(player.deck).to eq(deck)
  end

  it "has_lost? test" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
    player.name
    player.deck
    player.has_lost?

    expect(player.has_lost?).to eq(false)
  end

  it "player.deck.remove_card test" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
    player.name
    player.deck
    player.has_lost?
    player.deck.remove_card

    expect(player.deck.cards).to eq([card2, card3])
  end

  it "has_lost? test 2" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
    player.name
    player.deck

    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card
    player.has_lost?

    expect(player.has_lost?).to eq(true)
  end
# need to figure out how to enter a # w/o commenting the code behind it
  # it "deck is empty test" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  #   player = Player.new('Clarisa', deck)
  #   player.name
  #   player.deck
  #
  #   player.deck.remove_card
  #   player.deck.remove_card
  #   player.deck.remove_card
  #   player.has_lost?
  #
  #   expect(player.deck).to eq(#<Deck:0x00007fd8a5ac7058 @cards=[]>)
  # end



















end #final end
