require './test/test_helper'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, "Jack", 11)
    @card2 = Card.new(:heart, "10", 10)
    @card3 = Card.new(:heart, "9", 9)
    @card4 = Card.new(:diamond, "Jack", 11)
    @card5 = Card.new(:heart, "8", 8)
    @card6 = Card.new(:diamond, "Queen", 12)
    @card7 = Card.new(:heart, "3", 3)
    @card8 = Card.new(:diamond, "2", 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_turn_class_exists
    assert_instance_of Turn, @turn
  end

  def test_can_get_player_objects
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_spoils_of_war_is_an_array
    assert_equal Array.new, @turn.spoils_of_war
  end

  def test_can_determine_type_of_turn
    assert_equal :basic, @turn.type
  end

  def test_can_determine_turn_is_war
    war_turn_setup
    assert_equal :war, @war_turn.type
  end

  def test_can_determine_is_mad
    mad_turn_setup
    assert_equal :mutually_assured_destruction, @mad_turn.type
  end

  def test_can_check_if_cards_are_same
    war_turn_setup
    mad_turn_setup
    assert @war_turn.both_cards_same_at(0)
    assert @mad_turn.both_cards_same_at(2)
    assert_equal false, @turn.both_cards_same_at(0)
  end

  def test_can_determine_winner
    @turn.type
    @turn.determine_winner
    assert_equal @player1, @turn.winner
  end

  def test_can_assign_winner_by_comparing_cards 
    @turn.compare_cards_at(0)
    assert_equal @player1, @turn.winner
    @turn.compare_cards_at(2)
    assert_equal @player2, @turn.winner
  end

  def test_nobody_wins_mad_turn
    mad_turn_setup
    @mad_turn.type
    @mad_turn.determine_winner
    assert_equal "No Winner", @mad_turn.winner
  end

  def test_can_move_cards_to_spoils
    @turn.move_cards_to_spoils(1)
    assert_equal 2, @turn.spoils_of_war.length
    @turn.move_cards_to_spoils(3)
    assert_equal 8, @turn.spoils_of_war.length
  end

  def test_basic_turn_moves_cards_to_spoils
    @turn.type
    @turn.pile_cards
    assert_equal [@card1, @card3], @turn.spoils_of_war
  end

  def test_war_turn_moves_six_cards_to_spoils
    war_turn_setup
    @war_turn.type
    @war_turn.pile_cards
    assert_equal 6, @war_turn.spoils_of_war.length
  end

  def test_no_cards_in_spoils_when_mad
    mad_turn_setup
    @mad_turn.type
    @mad_turn.pile_cards
    assert_equal 0, @mad_turn.spoils_of_war.length
  end

  def test_cards_in_spoils_go_to_winner
    @turn.type
    @turn.determine_winner
    @turn.pile_cards
    @turn.award_spoils(@turn.winner)
    assert_equal 5, @turn.player1.deck.cards.length
  end

  def test_no_cards_in_spoils_when_turn_is_mad
    mad_turn_setup
    @mad_turn.type
    @mad_turn.determine_winner
    @mad_turn.pile_cards
    assert_equal 0, @mad_turn.spoils_of_war.length
  end

  def test_six_cards_in_spoils_when_turn_is_war
    war_turn_setup
    @war_turn.type
    @war_turn.determine_winner
    @war_turn.pile_cards
    assert_equal 6, @war_turn.spoils_of_war.length
    @war_turn.award_spoils(@war_turn.winner)
    assert_equal 6, @war_turn.player2.deck.cards.length
  end

  def test_can_display_turn_type
    @turn.type
    assert_nil @turn.display_type
  end

  def test_can_display_war_turn_type
    war_turn_setup
    @war_turn.type
    assert_equal " WAR -", @war_turn.display_type
  end

  def test_can_display_mad_turn_type
    mad_turn_setup
    @mad_turn.type
    assert_equal " *mutually assured destruction*", @mad_turn.display_type
  end

  def test_can_show_cards_to_be_won
    @turn.type
    @turn.determine_winner
    @turn.pile_cards
    assert_equal "Megan won 2 cards", @turn.show_cards_won
  end

  def test_show_cards_won_in_war_turn
    war_turn_setup
    @war_turn.type
    @war_turn.determine_winner
    @war_turn.pile_cards
    assert_equal "Napoleon won 6 cards", @war_turn.show_cards_won
  end

  def test_shows_no_cards_in_mad_turn
    mad_turn_setup
    @mad_turn.type
    @mad_turn.pile_cards
    assert_equal "6 cards removed from play", @mad_turn.show_cards_won
  end

  def war_turn_setup
    war_deck_1 = Deck.new([@card1, @card2, @card3])
    war_deck_2 = Deck.new([@card4, @card5, @card6])
    war_player_1 = Player.new("Sun Tzu", war_deck_1)
    war_player_2 = Player.new("Napoleon", war_deck_2)
    @war_turn = Turn.new(war_player_1, war_player_2)
  end

  def mad_turn_setup
    card9 = Card.new(:club, "9", 9)
    mad_deck_1 = Deck.new([@card1, @card2, @card3])
    mad_deck_2 = Deck.new([@card4, @card5, card9])
    mad_player_1 = Player.new("Johnny", mad_deck_1)
    mad_player_2 = Player.new("River", mad_deck_2)
    @mad_turn = Turn.new(mad_player_1, mad_player_2)
  end

end
