require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'Jack', 11)
    card_3 = Card.new(:club, 'Two', 2)

    @deck = Deck.new([card_1, card_2, card_3])

    @player = Player.new('Alex', @deck)
  end

  def test_it_exists
    assert_instance_of(Player, @player);
  end

  def test_it_has_readable_attributes
    assert_equal 'Alex', @player.name
    assert_equal @deck, @player.deck
  end
end
