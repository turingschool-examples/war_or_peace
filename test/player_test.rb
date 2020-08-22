require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_player_has_a_name
    skip
    player = Player.new("Matt")

    assert_equal "Matt", player.name
  end

  def test_player_starts_with_an_empty_deck
    skip
    player = Player.new("Matt")

    assert_equal [], player.deck
  end

  def test_player_gets_delt_3_cards
    # skip
    card1 = Card.new(:hearts, "10", 10)
    card2 = Card.new(:spades, "Queen", 12)
    card3 = Card.new(:diamonds, "5", 5)

    deck = Deck.new([card1, card2, card3])


    player = Player.new("Edward", deck)
    assert_equal 3, player.deck.cards.count
    require "pry"; binding.pry
  end



end
