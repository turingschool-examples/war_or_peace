require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamonds, "Jack", 11)

    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)

    @basic_deck_1 = Deck.new([card1, card2, card5, card8])
    @basic_deck_2 = Deck.new([card3, card4, card6, card7])

    @war_deck_1 = Deck.new([card1, card2, card5, card8])
    @war_deck_2 = Deck.new([card4, card3, card6, card7])

    @mad_deck_1 = Deck.new([card1, card2, card5, card8])
    @mad_deck_2 = Deck.new([card4, card3, Card.new(:diamond, "8", 8), card7])
  end

  def test_it_exists
    player1 = Player.new("Megan", @basic_deck_1)
    player2 = Player.new("Aurora", @basic_deck_2)

    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_it_knows_both_players
    player1 = Player.new("Megan", @basic_deck_1)
    player2 = Player.new("Aurora", @basic_deck_2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
  end

  def test_it_initializes_with_no_spoils_of_war
    player1 = Player.new("Megan", @basic_deck_1)
    player2 = Player.new("Aurora", @basic_deck_2)

    turn = Turn.new(player1, player2)

    assert_empty turn.spoils_of_war
  end

  def test_it_has_basic_turn_type_when_first_cards_not_equal
    player1 = Player.new("Megan", @basic_deck_1)
    player2 = Player.new("Aurora", @basic_deck_2)

    turn = Turn.new(player1, player2)

    refute player1.deck.first_card == player2.deck.first_card

    assert_equal :basic, turn.type
  end

  def test_it_has_war_turn_type_when_first_cards_are_equal
    player1 = Player.new("Megan", @war_deck_1)
    player2 = Player.new("Aurora", @war_deck_2)

    turn = Turn.new(player1, player2)

    assert player1.deck.first_card == player2.deck.first_card

    assert_equal :war, turn.type
  end

  def test_it_has_mad_turn_type_when_first_and_third_cards_are_equal
    player1 = Player.new("Megan", @mad_deck_1)
    player2 = Player.new("Aurora", @mad_deck_2)

    turn = Turn.new(player1, player2)

    assert player1.deck.first_card == player2.deck.first_card
    assert player1.deck.third_card == player2.deck.third_card

    assert_equal :mutually_assured_destruction, turn.type
  end


  def test_it_knows_basic_winner_has_higher_first_card
    player1 = Player.new("Megan", @basic_deck_1)
    player2 = Player.new("Aurora", @basic_deck_2)

    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type

    assert player1.deck.first_card > player2.deck.first_card

    assert_equal player1, turn.winner
  end

  def test_it_knows_war_winner_has_higher_third_card
    player1 = Player.new("Megan", @war_deck_1)
    player2 = Player.new("Aurora", @war_deck_2)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type

    assert player1.deck.third_card < player2.deck.third_card

    assert_equal player2, turn.winner
  end

  def test_it_knows_mad_winner_when_first_and_third_cards_equal
    player1 = Player.new("Megan", @mad_deck_1)
    player2 = Player.new("Aurora", @mad_deck_2)

    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type

    assert player1.deck.first_card == player2.deck.first_card
    assert player1.deck.third_card == player2.deck.third_card

    assert_equal "No Winner", turn.winner
  end

  def test_it_piles_one_card_when_basic
    player1 = Player.new("Megan", @basic_deck_1)
    player2 = Player.new("Aurora", @basic_deck_2)

    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
    assert_empty turn.spoils_of_war

    expected = [@basic_deck_1.cards[0], @basic_deck_2.cards[0]]

    turn.pile_cards

    assert_equal expected, turn.spoils_of_war

    assert_equal 3, player1.deck.cards.size
    assert_equal 3, player2.deck.cards.size
  end

  def test_it_piles_three_cards_when_war
    # skip
    player1 = Player.new("Megan", @war_deck_1)
    player2 = Player.new("Aurora", @war_deck_2)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type

    assert_empty turn.spoils_of_war

    expected = [@war_deck_1.cards[0..2], @war_deck_2.cards[0..2]].flatten

    turn.pile_cards

    assert_equal expected, turn.spoils_of_war

    assert_equal 1, player1.deck.cards.size
    assert_equal 1, player2.deck.cards.size
  end

  def test_it_exiles_three_cards_when_mad
    skip
    player1 = Player.new("Megan", @mad_deck_1)
    player2 = Player.new("Aurora", @mad_deck_2)

    turn = Turn.new(player1, player2)

    assert_empty turn.spoils_of_war

    turn.pile_cards
  end

end
