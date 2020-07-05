require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/deck'
require './lib/player'


class PlayerTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)

    player = Player.new('Priya', deck)
  end

  def test_player_has_lost
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)
    player = Player.new('Priya', deck)
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card
    # assert_equal "Priya has lost the war.! The battle drums still call, perhaps your luck will be better next time.", player.has_lost?
    assert_equal true, player.has_lost?
    # Played with pry to ensure edge cases and it looks like no matter what my
    # deck size is, I get the has_lost message... something is wrong with my CLass file

    # Tested numerous times and tested with pry. WORKS!
  end
end
