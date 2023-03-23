require "./card"
require "./deck"
require "./player"
require "./turn"

RSpec.describe Turn do
  it "returns the correct turn type" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    expect(turn.type).to eq(:basic)
  end

  it "determines a winner for BASIC turns" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    winner = turn.winner
    expect(winner).to eq(player1)
  end

  it "piles cards and puts them in spoils of war for BASIC turns" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    turn.winner
    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card1, card3])
  end

  it "awards spoils to winner of BASIC turns" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
    expect(player2.deck.cards).to eq([card4, card6, card7])
  end

  it "returns the correct turn type WAR" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    expect(turn.type).to eq(:war)
  end

  it "determines a winner for WAR turns" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    winner = turn.winner
    expect(winner).to eq(player2)
  end

  it "piles cards and puts them in spoils of war for WAR turns" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    turn.winner
    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
  end

  it "awards spoils to winner of WAR turns" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    expect(player1.deck.cards).to eq([card8])
    expect(player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
  end

  it "returns the correct turn type MUTUALLY ASSURED DESTRUCTION" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "8", 8)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it "determines a winner for MUTUTALL ASSURED DESTRUCTION turns" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "8", 8)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Michael", deck1)
    player2 = Player.new("Carolyn", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    winner = turn.winner
    expect(winner).to eq("No Winner")
  end
end