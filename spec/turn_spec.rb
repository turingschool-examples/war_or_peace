
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do

  it "exists" do
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
    expect(turn).to be_an_instance_of(Turn)
  end

 it "checks turn type" do
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

   turn1 = Turn.new(player1, player2)
   expect(turn1.type).to eq(:basic)

   # rearranged card list for war
   deck3 = Deck.new([card4, card3, card6, card8])
   player2 = Player.new("Bob", deck3)

   turn2 = Turn.new(player1, player2)
   expect(turn2.type).to eq(:war)

   # rearrange for mutually assured destruction
   card9 = Card.new(:heart, '8', 8)
   deck4 = Deck.new([card4, card3, card9, card8])
   player2 = Player.new('Sean', deck4)

   turn3 = Turn.new(player1, player2)
   expect(turn3.type).to eq(:mutually_assured_destruction)
 end

 it "checks for No winner" do
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

   expect(turn.winner).to eq('No winner.')
 end

 it "check basic winner" do
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
   expect(turn.winner).to eq(player1)

 end

 it "piles cards into spoils of war" do
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
   winner = turn.winner

   expect(turn.type).to eq(:basic)
   expect(turn.spoils_of_war).to eq([])
   turn.pile_cards
   expect(turn.spoils_of_war).to eq([card1, card3])
 end

 it "awards spoils on basic" do
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
   winner = turn.winner

   expect(turn.type).to eq(:basic)
   turn.pile_cards
   expect(turn.spoils_of_war).to eq([card1, card3])
   turn.award_spoils(winner)
   expect(turn.player1.deck.cards).to eq([card2, card5, card8, card1, card3])
 end

 it "awards spoils on war" do
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
   winner = turn.winner

   expect(turn.type).to eq(:war)
   turn.pile_cards
   expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
   turn.award_spoils(winner)
   expect(turn.player1.deck.cards).to eq([card8])
   expect(turn.player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
 end

 it "awards no spoils on mad" do
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
   winner = turn.winner


   expect(turn.winner).to eq('No winner.')
   expect(turn.spoils_of_war).to eq([])
   turn.pile_cards
   expect(player1.deck.cards).to eq([card8])
   expect(player2.deck.cards).to eq([card7])
 end
end
