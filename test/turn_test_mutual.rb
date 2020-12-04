require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/player'

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
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_type_mutual
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card6, card3, card4, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_winner_mutual
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card6, card3, card4, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner

      assert_equal :mutually_assured_destruction, turn.type
      require "pry"; binding.pry
      assert_equal No Winner, turn.winner
  end
  #
  # def test_pile_cards_war
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 9)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card4, card3, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #
  #   assert_equal :war, turn.type
  #   assert_equal 4, player1.deck.cards.size
  #   assert_equal 4, player2.deck.cards.size
  #   assert_empty turn.spoils_of_war
  #   turn.pile_cards
  #
  #   assert_equal 1, player1.deck.cards.size
  #   assert_equal 1, player2.deck.cards.size
  # end
  #
  # def test_award_spoils
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '10', 10)
  #   card3 = Card.new(:heart, '9', 9)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:heart, '8', 8)
  #   card6 = Card.new(:diamond, 'Queen', 12)
  #   card7 = Card.new(:heart, '3', 3)
  #   card8 = Card.new(:diamond, '2', 2)
  #   deck1 = Deck.new([card1, card2, card5, card8])
  #   deck2 = Deck.new([card4, card3, card6, card7])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #   winner = turn.winner
  #
  #   assert_equal :war, turn.type
  #   turn.pile_cards
  #   assert_equal [card1, card2, card5, card4, card3, card6], turn.spoils_of_war
  #   turn.award_spoils(winner)
  #   assert_empty turn.spoils_of_war
  #   assert_equal [card7, card1, card2, card5, card4, card3, card6], winner.deck.cards
  # end
end
