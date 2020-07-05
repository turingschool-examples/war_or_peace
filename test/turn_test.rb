require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn.rb'
require "pry"

class TurnTest < Minitest::Test

  # def test_it_exists
  #   turn = Turn.new
  #
  #   assert_instance_of Turn, turn
  # end

  # def test_it_has_readable_attributes
  #
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 9)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #
  #   turn = Turn.new(player1, player2)
  #     # binding.pry
  #
  #   assert_equal "Megan", turn.player1.name
  #   assert_equal deck1, turn.player1.deck
  #
  #   assert_equal "Aurora", turn.player2.name
  #   assert_equal deck2, turn.player2.deck
  #   assert_equal [], turn.spoils_of_war
  # end


  # def test_it_has_type
  #
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 9)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card3, card4, card6, card7])
  #   deck3 = Deck.new([card1, card2, card5, card8])
  #   deck4 = Deck.new([card1, card2, card8, card4])
  #
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   player3 = Player.new("Phil", deck3)
  #   player4 = Player.new("Robert", deck4)
  #
  #   turn = Turn.new(player1, player2)
  #     assert_equal :basic, turn.type
  #
  #   turn = Turn.new(player1, player3)
  #     assert_equal :mutually_assured_destruction, turn.type
  #
  #   turn = Turn.new(player1, player4)
  #     assert_equal :war, turn.type
  # end

  # def test_it_has_winner
  #
  #     card1 = Card.new(:heart, 'Jack', 11)
  #     card2 = Card.new(:heart, '10', 10)
  #     card3 = Card.new(:heart, '9', 9)
  #     card4 = Card.new(:diamond, 'Jack', 11)
  #     card5 = Card.new(:heart, '8', 8)
  #     card6 = Card.new(:diamond, 'Queen', 12)
  #     card7 = Card.new(:heart, '3', 3)
  #     card8 = Card.new(:diamond, '2', 2)
  #
  #     deck1 = Deck.new([card1, card2, card5, card8])
  #     deck2 = Deck.new([card3, card4, card6, card7])
  #     deck3 = Deck.new([card1, card2, card5, card8])
  #     deck4 = Deck.new([card1, card2, card8, card4])
  #
  #     player1 = Player.new("Megan", deck1)
  #     player2 = Player.new("Aurora", deck2)
  #     player3 = Player.new("Phil", deck3)
  #     player4 = Player.new("Robert", deck4)
  #
  #     turn = Turn.new(player1, player2)
  #       assert_equal player1, turn.winner
  #
  #     turn = Turn.new(player2, player1)
  #       assert_equal player1, turn.winner
  #
  #     turn = Turn.new(player1, player4)
  #       assert_equal player1, turn.winner
  #
  #     turn = Turn.new(player1, player3)
  #       assert_equal "No winner", turn.winner
  #     end

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
      deck3 = Deck.new([card1, card2, card5, card8])
      deck4 = Deck.new([card1, card2, card8, card4])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      player3 = Player.new("Phil", deck3)
      player4 = Player.new("Robert", deck4)

      # turn = Turn.new(player1, player2)
      # assert_equal [card1, card3], turn.pile_cards
      #
      # turn = Turn.new(player1, player4)
      # assert_equal [card1, card2, card5, card1, card2, card8], turn.pile_cards

      turn = Turn.new(player1, player3)
      assert_equal [card8], [card8], turn.pile_cards
     end


end
