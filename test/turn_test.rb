require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'
require 'pry'

class TurnTest < MiniTest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_award_spoils_for_basic
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(player1, player2)

    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    award_array = [card2, card3, card1, card4]
    assert_equal award_array, winner.deck.cards
    assert_equal [card5, card6], turn.player2.deck.cards
  end

  def test_award_spoils_for_war
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'King', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, 'Queen', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_war = Turn.new(player1, player2)

    winner = turn_war.winner
    turn_war.pile_cards
    turn_war.award_spoils(winner)
    award_array = [card1, card4, card2, card5, card3, card6]
    assert_equal award_array, winner.deck.cards
    assert_equal [], deck.cards
  end

  def test_award_spoils_for_destruction
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_destruction = Turn.new(player1, player2)

    winner = turn_destruction.winner
    turn_destruction.pile_cards
    turn_destruction.award_spoils(winner)

    assert_equal [], turn_destruction.spoils_of_war
    assert_equal turn_destruction.player1.deck, deck
    assert_equal turn_destruction.player2.deck, deck2
  end

  def test_sending_player_cards_to_spoil_of_war_for_basic
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards
    assert_equal [card1, card4], turn.spoils_of_war
    assert_equal [card2, card3], player1.deck.cards
    assert_equal [card5, card6], player2.deck.cards
  end

  def test_basic_pile
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(player1, player2)

    turn.basic_pile
    assert_equal [card1, card4], turn.spoils_of_war
    assert_equal [card2, card3], player1.deck.cards
    assert_equal [card5, card6], player2.deck.cards
  end

  def test_sending_player_cards_to_spoil_of_war_for_war
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'King', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, 'Queen', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_war = Turn.new(player1, player2)

    turn_war.pile_cards
    pile_array = [card1, card4, card2, card5, card3, card6]
    assert_equal pile_array, turn_war.spoils_of_war
    assert_equal [], turn_war.player1.deck.cards
    assert_equal [], turn_war.player2.deck.cards
  end

  def test_war_pile
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'King', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, 'Queen', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_war = Turn.new(player1, player2)

    turn_war.war_pile
    pile_array = [card1, card4, card2, card5, card3, card6]
    assert_equal pile_array, turn_war.spoils_of_war
    assert_equal [], turn_war.player1.deck.cards
    assert_equal [], turn_war.player2.deck.cards
  end

  def test_pile_cards_for_destruction
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_destruction = Turn.new(player1, player2)


    turn_destruction.pile_cards
    assert_equal [], turn_destruction.spoils_of_war
    assert_equal [], turn_destruction.player1.deck.cards
    assert_equal [], turn_destruction.player2.deck.cards
  end

  def test_destruction_pile
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_destruction = Turn.new(player1, player2)

    turn_destruction.destruction_pile
    assert_equal [], turn_destruction.spoils_of_war
    assert_equal [], turn_destruction.player1.deck.cards
    assert_equal [], turn_destruction.player2.deck.cards
  end

  def test_basic_type_of_turn
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_calculate_basic_type_of_turn
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.calculate_type
  end

  def test_war_type_of_turn
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'King', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, 'Queen', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_war = Turn.new(player1, player2)

    assert_equal :war, turn_war.type
  end

  def test_calcuate_war_type_of_turn
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'King', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, 'Queen', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_war = Turn.new(player1, player2)

    assert_equal :war, turn_war.calculate_type
  end

  def test_mutally_assured_destruction_type_of_turn
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_destruction = Turn.new(player1, player2)

    assert_equal :mutally_assured_destruction, turn_destruction.type
  end

  def test_calculate_mutally_assured_destruction_type_of_turn
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_destruction = Turn.new(player1, player2)

    assert_equal :mutally_assured_destruction, turn_destruction.calculate_type
  end

  def test_get_player_ranks
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(player1, player2)

    turn.get_ranks
    assert_equal card1.rank, turn.player_1_rank_0
    assert_equal card3.rank, turn.player_1_rank_2
    assert_equal card4.rank, turn.player_2_rank_0
    assert_equal card6.rank, turn.player_2_rank_2
  end

  def test_basic_winner
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_basic_winner_method
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    assert_equal player1, turn.basic_winner
  end

  def test_war_winner
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'King', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, 'Queen', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_war = Turn.new(player1, player2)

    assert_equal player2, turn_war.winner
  end

  def test_war_winner_method
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'King', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, 'Queen', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_war = Turn.new(player1, player2)

    turn_war.type
    assert_equal player2, turn_war.war_winner
  end

  def test_mutally_assured_destruction_winner
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 12)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)

    turn_destruction = Turn.new(player1, player2)

    assert_equal "No Winner", turn_destruction.winner
  end


end
