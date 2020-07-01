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
    require 'pry'; binding.pry
  end
end
