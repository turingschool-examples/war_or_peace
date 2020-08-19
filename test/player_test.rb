require './test/test_helper'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, "Queen", 12)
    @card2 = Card.new(:spade, "3", 3)
    @card3 = Card.new(:heart, "Ace", 14)
    @deck1 = Deck.new([@card1, @card2, @card3])
    @player1 = Player.new("Megan", @deck1)
  end

  def test_player_class_exists
    assert_instance_of Player, @player1
  end

  def test_can_get_player_name
    assert_equal "Megan", @player1.name
  end

  def test_can_get_player_deck
    assert_equal @deck1, @player1.deck
  end
end
