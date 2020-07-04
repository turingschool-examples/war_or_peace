require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require "pry"

 class PlayerTest < Minitest::Test
  # def test_it_exists
  #   player = Player.new
  #
  #   assert_instance_of Player, player
  # end

#   def test_it_has_readable_attributes
#     card1 = Card.new(:diamond, 'Queen', 12)
#     card2 = Card.new(:spade, '3', 3)
#     card3 = Card.new(:heart, 'Ace', 14)
#
#     deck = Deck.new([card1, card2, card3])
#
#     player = Player.new('Clarisa', deck)
#
#     assert_equal 'Clarisa', player.name
#
#     assert_equal deck, player.deck
#     # binding.pry
#   end
# end

  def test_player_has_lost?
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card

    assert_equal true, player.has_lost?
    # binding.pry
  end
end
