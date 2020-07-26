require './test/test_helper'

class TurnTest < Minitest::Test
  def test_class_turn_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card3, card5, card7])
    player_1 = Player.new('Clarisa', deck1)
    deck2 = Deck.new([card2, card4, card6, card8])
    player_2 = Player.new('Anne', deck2)
    turn1 = Turn.new(player_1, player_2)

    assert_instance_of Turn, turn1
  end

  def test_type_is_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card3, card5, card7])
    player_1 = Player.new('Clarisa', deck1)
    deck2 = Deck.new([card2, card4, card6, card8])
    player_2 = Player.new('Anne', deck2)
    turn1 = Turn.new(player_1, player_2)

    assert_equal :basic, turn1.type
  end

  def test_player_can_win
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card3, card5, card7])
    player_1 = Player.new('Clarisa', deck1)
    deck2 = Deck.new([card2, card4, card6, card8])
    player_2 = Player.new('Anne', deck2)
    turn1 = Turn.new(player_1, player_2)

    assert_equal "player1", turn1.winner?
  end

  def test_nobody_wins_mutually_assured_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:spade, 'Jack', 11)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, 'Queen', 12)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card3, card5, card7])
    player_1 = Player.new('Clarisa', deck1)
    deck2 = Deck.new([card2, card4, card6, card8])
    player_2 = Player.new('Anne', deck2)
    turn1 = Turn.new(player_1, player_2)

    assert_equal "No Winner", turn1.winner?
  end

  def test_can_pile_cards_into_spoils
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card3, card5, card7])
    player_1 = Player.new('Clarisa', deck1)
    deck2 = Deck.new([card2, card4, card6, card8])
    player_2 = Player.new('Anne', deck2)
    turn1 = Turn.new(player_1, player_2)
    turn1.pile_cards

    assert_equal [card1, card2], turn1.spoils_of_war
  end

  def test_no_cards_in_pile_when_mutually_assured_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:spade, 'Jack', 11)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, 'Queen', 12)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card3, card5, card7])
    player_1 = Player.new('Clarisa', deck1)
    deck2 = Deck.new([card2, card4, card6, card8])
    player_2 = Player.new('Anne', deck2)
    turn1 = Turn.new(player_1, player_2)
    turn1.pile_cards

    assert turn1.spoils_of_war.empty?
    assert_equal [card7], turn1.player1.deck.cards
    assert_equal [card8], turn1.player2.deck.cards
  end

  def test_spoils_go_to_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card3, card5, card7])
    player_1 = Player.new('Clarisa', deck1)
    deck2 = Deck.new([card2, card4, card6, card8])
    player_2 = Player.new('Anne', deck2)
    turn1 = Turn.new(player_1, player_2)
    assert_equal "player1", turn1.winner?
    winner = turn1.winner
    turn1.pile_cards

    assert_equal [card1, card2], turn1.spoils_of_war
    turn1.award_spoils(winner)
    assert_equal 5, turn1.player1.deck.cards.length
  end

  def test_player_loses_when_deck_is_empty
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    deck1 = Deck.new([card1])
    player_1 = Player.new('Clarisa', deck1)
    deck2 = Deck.new([card2])
    player_2 = Player.new('Anne', deck2)
    turn1 = Turn.new(player_1, player_2)
    assert_equal "player1", turn1.winner?
    winner = turn1.winner
    turn1.pile_cards
    turn1.award_spoils(winner)

    assert turn1.player2.has_lost?
  end

  def test_six_cards_when_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:spade, 'Jack', 11)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, 'Queen', 12)
    card6 = Card.new(:diamond, '10', 10)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card3, card5, card7])
    player_1 = Player.new('Clarisa', deck1)
    deck2 = Deck.new([card2, card4, card6, card8])
    player_2 = Player.new('Anne', deck2)
    turn1 = Turn.new(player_1, player_2)

    assert_equal :war, turn1.type
    turn1.winner?
    turn1.pile_cards

    assert_equal 6, turn1.spoils_of_war.length

    assert_equal turn1.player1, turn1.winner
    assert_equal 1, turn1.player1.deck.cards.length
    victor = turn1.winner

    turn1.award_spoils(victor)

    assert_equal 7, turn1.player1.deck.cards.length
  end
end
