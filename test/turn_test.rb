require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_a_turn_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
    assert_equal [], turn.spoils_of_war
  end

  def test_it_returns_basic_when_both_players_first_cards_are_different
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_it_returns_war_when_both_players_first_cards_are_the_same
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_it_returns_mutually_assured_destruction_when_players_first_and_last_cards_are_the_same
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card8, card5])
    deck2 = Deck.new([card4, card6, card3, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_it_returns_the_winner_of_basic_type_who_has_a_higher_rank_of_card_at_0
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_it_returns_winner_of_war_type_who_has_a_higher_rank_of_card_at_2
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner
  end

  def test_it_returns_no_winner_for_mutually_assured_destruction_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card8, card5])
    deck2 = Deck.new([card4, card6, card3, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end

  def test_when_it_is_a_basic_type_each_player_adds_one_card_from_deck_into_spoils_pile
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards

    assert_equal [card1, card3], turn.spoils_of_war
    assert_equal [card2, card5, card8], player1.deck.cards
    assert_equal [card4, card6, card7], player2.deck.cards
  end

  def test_when_it_is_a_war_type_each_player_sends_three_cards_from_top_of_deck_into_spoils_pile
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards

    assert_equal [card1, card4, card2, card3, card5, card6], turn.spoils_of_war
    assert_equal [card8], player1.deck.cards
    assert_equal [card7], player2.deck.cards
  end
end
