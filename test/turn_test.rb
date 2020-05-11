require 'minitest/autorun'
require '../lib/turn'
require '../lib/player'
require '../lib/deck'
require '../lib/card'
require 'pry'

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
    @spoils_of_war = []

    @deck3 = Deck.new([@card1, @card2, @card3, @card7])
    @deck4 = Deck.new([@card4, @card5, @card6, @card8])
    @player3 = Player.new("Tim", @deck3)
    @player4 = Player.new("Kat", @deck4)
    @turn_war = Turn.new(@player3, @player4)

    @card9 = Card.new(:diamond,"9",9)
    @deck5 = Deck.new([@card1, @card2, @card3, @card5])
    @deck6 = Deck.new([@card4,@card6, @card9,@card8])
    @player5 = Player.new("Timmy", @deck5)
    @player6 = Player.new("Kathryn", @deck6)
    @turn_mad = Turn.new(@player5, @player6)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_readable_attributes
    assert_equal "Aurora", @turn.player2.name
  end

  def test_it_can_determine_turn_types
    assert_equal :basic, @turn.type
    assert_equal :war, @turn_war.type
    assert_equal :mutually_assured_destruction, @turn_mad.type
  end

  def test_it_can_determine_winner
    assert_equal @player1, @turn.winner
    assert_equal @player4, @turn_war.winner
    assert_equal "No Winner", @turn_mad.winner
  end

  def test_it_can_pile_cards
    @turn.pile_cards
    assert_equal 2, @turn.spoils_of_war.count

    @turn_war.pile_cards
    assert_equal 6, @turn_war.spoils_of_war.count

    @turn_mad.pile_cards
    assert_equal 0, @turn_mad.spoils_of_war.count
  end

  def test_it_can_award_spoils

    assert_equal @player1, @turn.winner
    assert_equal 4, @player1.deck.cards.count

    @turn.pile_cards

    assert_equal 3, @player1.deck.cards.count
    assert_equal 2, @turn.spoils_of_war.count
    assert_equal 3, @turn.winner.deck.cards.count

    @turn.award_cards
    assert_equal 5, @turn.winner.deck.cards.count


  end


end
