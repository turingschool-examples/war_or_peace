require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:spade, 'Ten', 10)
    card2 = Card.new(:heart, 'Three', 3)
    card3 = Card.new(:club, 'Jack', 11)
    cards = []
    cards << card1
    cards << card2
    cards << card3
    deck = Deck.new(cards)

    player = Player.new('Charles', deck)

    assert_instance_of(Player, player)
  end

  def test_loss_condition
    card1 = Card.new(:spade, 'Ten', 10)
    card2 = Card.new(:heart, 'Three', 3)
    card3 = Card.new(:club, 'Jack', 11)
    cards = []
    cards << card1
    cards << card2
    cards << card3
    deck = Deck.new(cards)

    player = Player.new('Charles', deck)

    assert_equal(false, player.lost?)

    player.deck.remove_card
    assert_equal(false, player.lost?)
    player.deck.remove_card
    assert_equal(false, player.lost?)
    player.deck.remove_card

    assert_equal(true, player.lost?)
    assert_equal(0, player.deck.cards.length)
  end

  def test_name
    card1 = Card.new(:spade, 'Ten', 10)
    card2 = Card.new(:heart, 'Three', 3)
    card3 = Card.new(:club, 'Jack', 11)
    cards = []
    cards << card1
    cards << card2
    cards << card3
    deck = Deck.new(cards)

    player = Player.new('Charles', deck)

    assert_equal('Charles', player.name)
  end
end
