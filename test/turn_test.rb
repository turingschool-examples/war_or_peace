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

  def test_can_determine_winner
    @turn.type
    @turn.determine_winner
    assert_equal @player1, @turn.winner
  end

  def test_nobody_wins_mad_turn
    mad_turn_setup
    @mad_turn.type
    @mad_turn.determine_winner
    assert_equal "No Winner", @mad_turn.winner
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
    mad_player_1 = Player.new("Joker", mad_deck_1)
    mad_player_2 = Player.new("River", mad_deck_2)
    @mad_turn = Turn.new(mad_player_1, mad_player_2)
  end

end
