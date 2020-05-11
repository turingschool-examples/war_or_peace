require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test


  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card5 = Card.new(:heart, '8', 8)
    @mad_card5 = Card.new(:spade, 'Queen', 12)
    @card8 = Card.new(:diamond, '2', 2)


    @card3 = Card.new(:heart, '9', 9)
    @war_card3 = Card.new(:spade, 'Jack', 11)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)


    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
    # require "pry"; binding.pry
  end


  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_player1_exists
    assert_equal @player1, @turn.player1
  end

  def test_player1_exists
    assert_equal @player2, @turn.player2
  end

  def test_spoils_of_war_array
    assert_equal [], @turn.spoils_of_war
  end





  #Turn type tests
  def test_turn_type_basic
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_turn_type_war
    deck1 = Deck.new([@card1, @card2, @card8, @card5])
    deck2 = Deck.new([@war_card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_turn_type_mutually_assured_destruction
    deck1 = Deck.new([@card1, @card2, @mad_card5, @card8])
    deck2 = Deck.new([@war_card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end





  #Winner tests
  def test_for_winner_type_basic
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_for_winner_type_war
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@war_card3,@card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner
  end

  def test_for_winner_type_mutually_assured_destruction
    deck1 = Deck.new([@card1, @card2, @mad_card5, @card8])
    deck2 = Deck.new([@war_card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end




  # Pile cards tests
  def test_pile_cards_for_turn_type_basic
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards

    assert_equal [@card1, @card3], turn.spoils_of_war
  end

  def test_pile_cards_for_turn_type_war
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@war_card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards

    assert_equal [@card1,@card2,@card5,@war_card3,@card4,@card6], turn.spoils_of_war
  end

  # def test_pile_cards_for_turn_type_MAD
  #   deck1 = Deck.new([@card1, @card2, @mad_card5, @card8])
  #   deck2 = Deck.new([@war_card3, @card4, @card6, @card7])
  #
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #
  #   turn = Turn.new(player1, player2)
  #
  #
  #   assert_equal players, turn.spoils_of_war
  #
  # end





  #Award spoils tests
  def test_award_spoils_for_turn_type_basic
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    winner = turn.winner

    assert_equal [@card1, @card2, @card5, @card8, @card3], turn.award_spoils
  end


end
