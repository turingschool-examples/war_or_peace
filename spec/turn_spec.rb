require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require 'pry'



RSpec.describe Turn do
  it "runs iteration 2 for turn with :basic type play" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
  # binding.pry
    expect(turn).to be_an_instance_of(Turn)
    expect(turn.player1).to eq player1
    expect(turn.player2).to eq player2
    expect(turn.spoils_of_war).to eq []
    expect(turn.type).to eq :basic
    winner = turn.winner
    expect(turn.winner).to eq player1
    turn.pile_cards
    expect(turn.spoils_of_war).to eq [card1, card3]
    turn.award_spoils(winner)
    expect(player1.deck).to eq (deck1)
    expect(player2.deck).to eq (deck2)

  end

  it "runs iteration 2 for turn with :war type play" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    winner = turn.winner
    expect(turn.winner).to eq player2
    turn.pile_cards
    expect(turn.spoils_of_war).to eq [card1, card4, card2, card3, card5, card6]
    turn.award_spoils(winner)
    player1.deck
    player2.deck

  end

  it "runs iteration 2 for turn with :war type play" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    winner = turn.winner
    turn.pile_cards
    turn.spoils_of_war
    player1.deck
    player2.deck
  end
end
  # it "returns the type of turn depending on the cards played against each other" do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 12)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #
  #   expect(turn.type).to eq :basic || :mutually_assured_destruction || :war
  # end
  #
  # it "states the winner of that turn" do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 9)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #
  #   expect(turn.winner).to eq player1
  # end
  #
  # it "states the winner of that turn" do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 12)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #
  #   expect(turn.winner).to eq player2
  # end
  #
  # it "states the winner of that turn" do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 11)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 13)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #
  #   expect(turn.winner).to eq player1
  # end
  #
  # it "states the winner of that turn" do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 11)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #
  #   expect(turn.winner).to eq player2
  # end
  #
  # it "shows that #mutually_assured_destruction happens and returns no winner" do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 11)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 8)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #
  #   expect(turn.winner).to eq "No Winner"
  # end
  #
  # it "#pile_cards holds the cards that were played" do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 9)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #
  #   expect(turn.pile_cards).to eq [card1, card3]
  #   # expect(turn.pile_cards).to eq [card1, card3, card2, card4, card5, card6]
  #   # expect(turn.pile_cards).to eq []
  # end
  #
  # xit "will add each of the cards in the @spoils_of_war array to the winner of the turn" do
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 9)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #
  #   expect(turn.player1.deck).to eq deck1
  # end




  # it "returns empty array for spoils_of_war" do
  #
  #   expect(turn.spoils_of_war).to eq []
  # end
  #
  # it "returns :basic for turn type" do
  #
  #   expect(turn.type).to eq :basic
  # end
  #
  # it "returns the winner for the turn" do
  #   # binding.pry
  #   expect(turn.winner).to eq player1
  # end

  # it ""

  # it "returns spoils of war for turn winner" do
  #   expect(turn.spoils_of_war).to eq [card1, card3]
  # end
