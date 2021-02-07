require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'
require '../lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    assert_instance_of Player, player
  end
  def test_it_has_readable_attributes

  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  deck = Deck.new([card1, card2, card3])
  player = Player.new('Clarisa', deck)
  assert_equal "Clarisa", player.name
  assert_equal deck, player.deck
  end

  def test_has_lost

  end
end
 player.has_lost?
#=> false

 player.deck.remove_card
#=> #<Card:0x007f9cc3a73a98 @rank=12, @suit=:diamond, @value="Queen">

 player.has_lost?
#=> false

 player.deck.remove_card
#=> #<Card:0x007f9cc3a03720 @rank=3, @suit=:spade, @value="3">

 player.has_lost?
#=> false

 player.deck.remove_card
#=> #<Card:0x007f9cc3a44c98 @rank=14, @suit=:heart, @value="Ace">

 player.has_lost?
#=> true

 player.deck
#=> #<Deck:0x007f9cc396bdf8 @cards=[]>
