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
    assert_equal @turn.player1, @player1
    assert_equal @turn.player2, @player2
  end

  def test_player_starts_with_no_spoils_of_war
    assert_equal @turn.spoils_of_war, []
  end

  def test_turn_type
    assert_equal @turn.type, :basic
  end

  def test_there_is_a_winner
    assert_equal @turn.winner, @player1
  end
end

#
#
# pry(main)> winner = turn.winner
# #=> #<Player:0x007fa3edae29d0 @deck=#<Deck:0x007fa3eda472c8...>, @name="Megan">
#
# pry(main)> turn.pile_cards
#
# pry(main)> turn.spoils_of_war
# #=> [#<Card:0x007fa3edaa0df0 @rank=11, @suit=:heart, @value="Jack">, #<Card:0x007fa3ed98d9b8 @rank=9, @suit=:heart, @value="9">]
#
# pry(main)> turn.award_spoils(winner)
#
# pry(main)> player1.deck
# #=> #<Deck:0x007fa3eda472c8 @cards=[#<Card:0x007fa3eda519a8...>, #<Card:0x007fa3edb263d8...>, #<Card:0x007fa3eda89308...>, #<Card:0x007fa3edaa0df0...>, #<Card:0x007fa3ed98d9b8...>]>
# pry(main)> player2.deck
# #=> #<Deck:0x007fa3ee11ee48 @cards=[#<Card:0x007fa3ee14ef80...>, #<Card:0x007fa3eda3e1f0...>, #<Card:0x007fa3edad1cc0...>]>
