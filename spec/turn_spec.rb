require 'rspec'
require './lib/turn.rb'

RSpec.describe Turn do
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
    turn_1 = Turn.new(player1, player2)

    expect(turn_1).to be_an_instance_of(Turn)
  end

  it "can identify the type of turn" do
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
    cards_3 = [card_2, card_1, card_3, card_4]
    cards_4 = [card_8, card_5, card_6, card_7]
    cards_5 = [card_2, card_1, card_3, card_5]
    cards_6 = [card_8, card_6, card_4, card_7]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    deck_3 = Deck.new(cards_3)
    deck_4 = Deck.new(cards_4)
    deck_5 = Deck.new(cards_5)
    deck_6 = Deck.new(cards_6)
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)
    player3 = Player.new("Sarah", deck_3)
    player4 = Player.new("Sam", deck_4)
    player5 = Player.new("Fia", deck_5)
    player6 = Player.new("Nara", deck_6)
    turn_1 = Turn.new(player1, player2)
    turn_2 = Turn.new(player3, player4)
    turn_3 = Turn.new(player5, player6)

    expect(turn_1.type).to eq(:basic)
    expect(turn_2.type).to eq(:war)
    expect(turn_3.type).to eq(:mutually_assured_destruction)

  end

  it "can identify who wins" do
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
    cards_3 = [card_2, card_1, card_3, card_4]
    cards_4 = [card_8, card_5, card_6, card_7]
    cards_5 = [card_2, card_1, card_3, card_5]
    cards_6 = [card_8, card_6, card_4, card_7]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    deck_3 = Deck.new(cards_3)
    deck_4 = Deck.new(cards_4)
    deck_5 = Deck.new(cards_5)
    deck_6 = Deck.new(cards_6)
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)
    player3 = Player.new("Sarah", deck_3)
    player4 = Player.new("Sam", deck_4)
    player5 = Player.new("Fia", deck_5)
    player6 = Player.new("Nara", deck_6)
    turn_1 = Turn.new(player1, player2)
    turn_2 = Turn.new(player3, player4)
    turn_3 = Turn.new(player5, player6)

    expect(turn_1.winner(turn_1.type)).to eq("player1")
    expect(turn_2.winner(turn_2.type)).to eq("player1")
    expect(turn_3.winner(turn_3.type)).to eq("No Winner")

  end

  it "can place cards into the spoils of war if :basic turn type" do
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
    cards_3 = [card_2, card_1, card_3, card_4]
    cards_4 = [card_8, card_5, card_6, card_7]
    cards_5 = [card_2, card_1, card_3, card_5]
    cards_6 = [card_8, card_6, card_4, card_7]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    deck_3 = Deck.new(cards_3)
    deck_4 = Deck.new(cards_4)
    deck_5 = Deck.new(cards_5)
    deck_6 = Deck.new(cards_6)
    deck_7 = Deck.new([card_1, card_5])
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)
    player3 = Player.new("Sarah", deck_3)
    player4 = Player.new("Sam", deck_4)
    player5 = Player.new("Fia", deck_5)
    player6 = Player.new("Nara", deck_6)
    turn_1 = Turn.new(player1, player2)
    turn_2 = Turn.new(player3, player4)
    turn_3 = Turn.new(player5, player6)


    turn_1.pile_cards(turn_1.type)
    expect(turn_1.spoils_of_war).to eq([card_1, card_5])




  end

  it "can place cards into the spoils of war if :war turn type" do
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
    cards_3 = [card_2, card_1, card_3, card_4]
    cards_4 = [card_8, card_5, card_6, card_7]
    cards_5 = [card_2, card_1, card_3, card_5]
    cards_6 = [card_8, card_6, card_4, card_7]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    deck_3 = Deck.new(cards_3)
    deck_4 = Deck.new(cards_4)
    deck_5 = Deck.new(cards_5)
    deck_6 = Deck.new(cards_6)
    deck_7 = Deck.new([card_1, card_5])
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)
    player3 = Player.new("Sarah", deck_3)
    player4 = Player.new("Sam", deck_4)
    player5 = Player.new("Fia", deck_5)
    player6 = Player.new("Nara", deck_6)
    turn_1 = Turn.new(player1, player2)
    turn_2 = Turn.new(player3, player4)
    turn_3 = Turn.new(player5, player6)


    turn_2.pile_cards(turn_2.type)
    expect(turn_2.spoils_of_war).to eq([card_2, card_1, card_3, card_8, card_5, card_6])
  end

  it "can remove cards if there is mutually_assured_destruction" do
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
    cards_3 = [card_2, card_1, card_3, card_4]
    cards_4 = [card_8, card_5, card_6, card_7]
    cards_5 = [card_2, card_1, card_3, card_5]
    cards_6 = [card_8, card_6, card_4, card_7]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    deck_3 = Deck.new(cards_3)
    deck_4 = Deck.new(cards_4)
    deck_5 = Deck.new(cards_5)
    deck_6 = Deck.new(cards_6)
    deck_7 = Deck.new([card_1, card_5])
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)
    player3 = Player.new("Sarah", deck_3)
    player4 = Player.new("Sam", deck_4)
    player5 = Player.new("Fia", deck_5)
    player6 = Player.new("Nara", deck_6)
    turn_1 = Turn.new(player1, player2)
    turn_2 = Turn.new(player3, player4)
    turn_3 = Turn.new(player5, player6)


    turn_3.pile_cards(turn_3.type)
    expect(turn_3.player1.deck.cards).to eq([card_5])
  end

  it "can award spoils" do
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
    cards_3 = [card_2, card_1, card_3, card_4]
    cards_4 = [card_8, card_5, card_6, card_7]
    cards_5 = [card_2, card_1, card_3, card_5]
    cards_6 = [card_8, card_6, card_4, card_7]
    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)
    deck_3 = Deck.new(cards_3)
    deck_4 = Deck.new(cards_4)
    deck_5 = Deck.new(cards_5)
    deck_6 = Deck.new(cards_6)
    deck_7 = Deck.new([card_1, card_5])
    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("John", deck_2)
    player3 = Player.new("Sarah", deck_3)
    player4 = Player.new("Sam", deck_4)
    player5 = Player.new("Fia", deck_5)
    player6 = Player.new("Nara", deck_6)
    turn_1 = Turn.new(player1, player2)
    turn_2 = Turn.new(player3, player4)
    turn_3 = Turn.new(player5, player6)
    winner1 = turn_1.winner(:basic)
  
    turn_1.pile_cards(turn_1.type)
    expect(turn_1.award_spoils(winner1)).to eq([card_2, card_3, card_4, card_1, card_5])
  end


end
