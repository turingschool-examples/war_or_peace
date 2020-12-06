require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_that_it_exists

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

  def test_a_basic_turn_type
    # skip
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
    turn.type
    assert_equal :basic, turn.type
  end

  def test_there_can_be_only_one_winner
    # skip
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
    turn.type
    assert_equal  player1, turn.winner
  end

  def test_that_the_winner_method_works_for_basic_turn
    # skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck2 = Deck.new([card1, card2, card5, card8])
    deck1 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.type
    assert_equal  player2, turn.winner
  end

    def test_that_cards_are_in_spoils_of_war
      # skip
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck2 = Deck.new([card1, card2, card5, card8])
      deck1 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.pile_cards
      assert_equal  2, turn.spoils_of_war.length
    end

        def test_spoils_can_be_awarded
          # skip
          card1 = Card.new(:heart, 'Jack', 11)
          card2 = Card.new(:heart, '10', 10)
          card3 = Card.new(:heart, '9', 9)
          card4 = Card.new(:diamond, 'Jack', 11)
          card5 = Card.new(:heart, '8', 8)
          card6 = Card.new(:diamond, 'Queen', 12)
          card7 = Card.new(:heart, '3', 3)
          card8 = Card.new(:diamond, '2', 2)
          deck2 = Deck.new([card1, card2, card5, card8])
          deck1 = Deck.new([card3, card4, card6, card7])
          player1 = Player.new("Megan", deck1)
          player2 = Player.new("Aurora", deck2)
          turn = Turn.new(player1, player2)
          turn.pile_cards
          turn.award_spoils(player1)
          assert_equal  5, player1.deck.cards.length
        end

        def test_that_it_is_a_war_turn
          # skip
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
          assert_equal :war, turn.type
        end

            def test_that_the_winner_method_works_for_war_turn
                  # skip
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
              assert_equal player2, turn.winner
            end

    def test_that_the_winner_of_war_gets_many_spoils
      # skip
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
      turn.pile_cards
      # require "pry"; binding.pry
      turn.award_spoils(player2)
      assert_equal 8, player2.deck.cards.length
    end

        def test_mutually_assured_destruction
          # skip
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
          assert_equal :mutually_assured_destruction, turn.type
          assert_equal "No Winner", turn.winner
        end
      end
