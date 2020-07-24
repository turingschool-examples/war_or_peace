require './test/test_helper'

class PlayerTest < Minitest::Test
  def test_player_class_exists
    card_1 = Card.new(:Heart, "Jack", 11)
    card_2 = Card.new(:Spade, "Jack", 11)
    card_3 = Card.new(:Diamond, "Queen", 12)
    card_4 = Card.new(:Club, "King", 13)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)
    player_1 = Player.new('Clarisa', deck)

    assert_instance_of Player, player_1
  end

  def test_player_has_name
    card_1 = Card.new(:Heart, "Jack", 11)
    card_2 = Card.new(:Spade, "Jack", 11)
    card_3 = Card.new(:Diamond, "Queen", 12)
    card_4 = Card.new(:Club, "King", 13)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)
    player_1 = Player.new('Clarisa', deck)

    assert_equal "Clarisa", player_1.name
  end

  def test_can_lose
    card_1 = Card.new(:Heart, "Jack", 11)
    card_2 = Card.new(:Spade, "Jack", 11)
    card_3 = Card.new(:Diamond, "Queen", 12)
    card_4 = Card.new(:Club, "King", 13)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)
    player_1 = Player.new('Clarisa', deck)

    player_1.deck.remove_card
    refute player_1.has_lost?
    player_1.deck.remove_card
    refute player_1.has_lost?
    player_1.deck.remove_card
    refute player_1.has_lost?
    player_1.deck.remove_card
    assert player_1.has_lost?
    assert player_1.deck.cards.empty?
  end

end
