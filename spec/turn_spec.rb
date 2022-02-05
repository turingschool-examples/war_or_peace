require "rspec"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "pry"

# describe Turn do
#   xit "has a good time" do
#     card1 = Card.new(:heart, "Jack", 11)
#     card2 = Card.new(:heart, "10", 10)
#     card3 = Card.new(:heart, "9", 9)
#     card4 = Card.new(:diamond, "Jack", 11)
#     card5 = Card.new(:heart, "8", 8)
#     card6 = Card.new(:diamond, "Queen", 12)
#     card7 = Card.new(:heart, "3", 3)
#     card8 = Card.new(:diamond, "2", 2)
#
#     deck1 = Deck.new([card1, card2, card5, card8])
#     expect(deck1.cards).to eq([card1, card2, card5, card8])
#
#     deck2 = Deck.new([card3, card4, card6, card7])
#     expect(deck2.cards).to eq([card3, card4, card6, card7])
#
#     player1 = Player.new("Megan", deck1)
#     expect(player1.name).to eq("Megan")
#     expect(player1.deck). to eq(deck1)
#     player2 = Player.new("Aurora", deck2)
#     expect(player2.name).to eq("Aurora")
#     expect(player2.deck). to eq(deck2)
#
#     turn = Turn.new(player1, player2)
#     # require "pry"; binding.pry
#
#     expect(turn).to be_an_instance_of(Turn)
#     expect(turn.player1).to eq(player1)
#     expect(turn.player2).to eq(player2)
#
#     expect(turn.spoils_of_war).to eq([])
#     expect(turn.type).to eq(:basic)
#     expect(turn.winner).to eq(player1)
#
#     winner = turn.winner
#     turn.pile_cards
#     # binding.pry
#
#     expect(turn.spoils_of_war).to eq([card1, card3])
#
#     turn.award_spoils(winner)
#
#     expect(player1.deck.cards). to eq([card2, card5, card8, card1, card3])
#   end
#
#     xit "awards the cards" do
#       card1 = Card.new(:heart, "Jack", 11)
#       card2 = Card.new(:heart, "10", 10)
#       card3 = Card.new(:heart, "9", 9)
#       card4 = Card.new(:diamond, "Jack", 11)
#       card5 = Card.new(:heart, "8", 8)
#       card6 = Card.new(:diamond, "Queen", 12)
#       card7 = Card.new(:heart, "3", 3)
#       card8 = Card.new(:diamond, "2", 2)
#       deck1 = Deck.new([card1, card2, card5, card8])
#       deck2 = Deck.new([card3, card4, card6, card7])
#       player1 = Player.new("Megan", deck1)
#       player2 = Player.new("Aurora", deck2)
#       turn = Turn.new(player1, player2)
#
#       winner = turn.winner
#       turn.pile_cards
#       expect(turn.spoils_of_war).to eq([card1, card3])
#       turn.award_spoils(winner)
#       expect(winner.deck.cards). to eq([card2, card5, card8, card1, card3])
#       expect(player2.deck.cards). to eq([card4, card6, card7])
#
#     end
# end

describe Turn do
  # card1 = Card.new(:heart, "Jack", 11)
  # card2 = Card.new(:heart, "10", 10)
  # card3 = Card.new(:heart, "9", 9)
  # card4 = Card.new(:diamond, "Jack", 11)
  # card5 = Card.new(:heart, "8", 8)
  # card6 = Card.new(:diamond, "Queen", 12)
  # card7 = Card.new(:heart, "3", 3)
  # card8 = Card.new(:diamond, "2", 2)
  # deck1 = Deck.new([card1, card2, card5, card8])
  # deck2 = Deck.new([card4, card3, card6, card7])
  # player1 = Player.new("Megan", deck1)
  # player2 = Player.new("Aurora", deck2)
  # turn = Turn.new(player1, player2)
  # puts turn.type

  xit "war baby!" do
    expect(turn.type).to eq(:war)
  end

  # winner = turn.winner
  # turn.pile_cards
  # binding.pry
  # #
  xit "what did I win" do
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
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards
    expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])
  end


  it "new hand" do
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
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards
    winner = turn.winner
    turn.award_spoils(winner)
    expect(player1.deck.cards).to eq([card8])
    expect(player2.deck.cards).to eq([card7, card1, card4, card2, card3, card5, card6])
    # binding.pry
  end

end
