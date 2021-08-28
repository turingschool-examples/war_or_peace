require 'rspec'
require './lib/player.rb'

RSpec.describe Player do
  it "exists" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    card_4 = Card.new(:club, "Ace", 14)
    card_5 = Card.new(:club, "5", 5)
    card_6 = Card.new(:spade, "Queen", 12)
    card_7 = Card.new(:heart, "8", 8)
    card_8 = Card.new(:diamond, "3", 3)
    cards_1 = [card_1, card_2, card_3, card_4]
    cards_2 = [card_5, card_6, card_7, card_8]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)
    expect(player1).to be_an_instance_of(Player)
  end

  it "has a player name" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    card_4 = Card.new(:club, "Ace", 14)
    card_5 = Card.new(:club, "5", 5)
    card_6 = Card.new(:spade, "Queen", 12)
    card_7 = Card.new(:heart, "8", 8)
    card_8 = Card.new(:diamond, "3", 3)
    cards_1 = [card_1, card_2, card_3, card_4]
    cards_2 = [card_5, card_6, card_7, card_8]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)

    expect(player1.player_name).to eq("Billy")
  end

  it "has a deck" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    card_4 = Card.new(:club, "Ace", 14)
    card_5 = Card.new(:club, "5", 5)
    card_6 = Card.new(:spade, "Queen", 12)
    card_7 = Card.new(:heart, "8", 8)
    card_8 = Card.new(:diamond, "3", 3)
    cards_1 = [card_1, card_2, card_3, card_4]
    cards_2 = [card_5, card_6, card_7, card_8]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)

    expect(player1.deck).to eq(deck_1)
  end

  it "has lost" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    card_4 = Card.new(:club, "Ace", 14)
    card_5 = Card.new(:club, "5", 5)
    card_6 = Card.new(:spade, "Queen", 12)
    card_7 = Card.new(:heart, "8", 8)
    card_8 = Card.new(:diamond, "3", 3)
    cards_1 = [card_1, card_2, card_3, card_4]
    cards_2 = [card_5, card_6, card_7, card_8]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    deck_3 = Deck.new([])
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)

    expect(player1.has_lost?).to eq(false)

    deck_1.remove_card
    deck_1.remove_card
    deck_1.remove_card
    deck_1.remove_card


    expect(player1.has_lost?).to eq(true)

  end
end
