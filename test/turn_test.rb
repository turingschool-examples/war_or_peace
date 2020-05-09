#turn type :basic
require "minitest/autorun"
require "minitest/pride"
 require './lib/card'
 require './lib/deck'
 require './lib/player'
 require './lib/turn'

 class TurnTest < Minitest::Test
   def test_it_exists
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

     assert_instance_of Turn, turn
   end

   def test_it_has_players
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

     assert_equal 'Megan', turn.player1.name
     assert_equal 'Aurora', turn.player2.name

     assert_instance_of Deck, turn.player1.deck
   end
   def test_it_has_spoils_of_war
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

     assert_equal [], turn.spoils_of_war
   end
   def test_it_has_a_basic_type
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

     assert_equal :basic , turn.type
   end
   def test_it_has_winner_at_basic_type
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

     assert_equal "Megan", turn.winner.name

   end
   def test_it_can_pile_cards
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

     turn.pile_cards

     assert_equal 2, turn.spoils_of_war.size

   end
   def test_it_has_a_war_type
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

      assert_equal :war , turn.type

      turn.pile_cards
      assert_equal 6 , turn.spoils_of_war.size

   end
   def test_it_has_a_mutually_assured_destruction_type
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

      assert_equal :mutually_assured_destruction , turn.type

      turn.pile_cards
      assert_equal 1 , turn.player1.deck.cards.size
      assert_equal 1 , turn.player2.deck.cards.size
      assert_equal [] , turn.spoils_of_war
   end
   def test_it_has_winner_at_mutually_assured_destruction_type
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

     assert_equal "No winner", turn.winner
   end

   def test_it_award_spoils_basic
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
     turn.pile_cards

     assert_equal 2, turn.spoils_of_war.size

     turn.award_spoils(winner)

     assert_equal 5 , winner.deck.cards.size
     assert_equal [], turn.spoils_of_war

   end
 end
