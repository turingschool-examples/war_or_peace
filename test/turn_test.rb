require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)


    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists

    assert_instance_of Turn, @turn
  end

  def test_it_has_player1

    assert_equal @player1, @turn.player1
  end

  def test_it_has_player2

    assert_equal @player2, @turn.player2
  end

  def test_it_has_spoils_of_war

    assert_equal [], @turn.spoils_of_war
  end

  def test_it_has_basic_type

    assert_equal :basic, @turn.type
  end

  def test_it_has_war_type

    deck3 = Deck.new([@card1, @card2, @card5, @card8])
    deck4 = Deck.new([@card4, @card3, @card6, @card7])

    player3 = Player.new("JoMama", deck3)
    player4 = Player.new("NunyaBizness", deck4)

    turn = Turn.new(player3, player4)

    assert_equal :war, turn.type
  end

  def test_it_has_mutually_assured_destruction_type
    card9 = Card.new(:clubs, '3', 3)

    deck3 = Deck.new([@card1, @card2, card9, @card5])
    deck4 = Deck.new([@card4, @card3, @card7, @card6])

    player3 = Player.new("JoMama", deck3)
    player4 = Player.new("NunyaBizness", deck4)

    turn = Turn.new(player3, player4)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_it_has_basic_winner

    assert_equal @player1, @turn.winner
  end

  def test_it_has_a_war_winner

    deck3 = Deck.new([@card1, @card2, @card5, @card8])
    deck4 = Deck.new([@card4, @card3, @card6, @card7])

    player3 = Player.new("JoMama", deck3)
    player4 = Player.new("NunyaBizness", deck4)

    turn = Turn.new(player3, player4)

    assert_equal player4, turn.winner
  end

  def test_it_has_no_winner
    card9 = Card.new(:clubs, '3', 3)

    deck3 = Deck.new([@card1, @card2, card9, @card5])
    deck4 = Deck.new([@card4, @card3, @card7, @card6])

    player3 = Player.new("JoMama", deck3)
    player4 = Player.new("NunyaBizness", deck4)

    turn = Turn.new(player3, player4)

    assert_equal "No Winner", turn.winner
  end

  # def test_it_has_basic_pile_cards
  #   @turn.pile_cards
  #
  #   assert_equal [@card1, @card3], @turn.spoils_of_war
  # end



end
