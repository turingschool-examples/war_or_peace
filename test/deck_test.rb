require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new(:spades, 'Ace', 13)
    cards = [card_1]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_readable_attributes
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)

    assert_equal deck.cards, cards
  end

  def test_rank_of_card_at
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)

    assert_equal deck.rank_of_card_at(0), 12
    assert_equal deck.rank_of_card_at(2), 14
  end

  def test_high_ranking_cards
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)

    assert_equal deck.high_ranking_cards, cards = [card1, card3]
  end

  def test_percent_high_ranking_cards
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)
    deck.percent_high_ranking

    assert_equal deck.percent_high_ranking, 66.67
  end

  def test_remove_card
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)

    assert_equal deck.remove_card, card1
  end

  def test_add_card
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    assert_equal deck.cards, [card2, card3, card4]
  end

  def test_generate_standard_deck
    deck = Deck.new
    deck.generate_standard_deck

    assert_equal deck.cards.length,  52
  end

  def test_randomize_deck
    deck = Deck.new
    deck.generate_standard_deck

    assert_equal deck.cards[0].suit, :heart
    assert_equal deck.cards[0].value, '2'
    assert_equal deck.cards[1].suit, :heart
    assert_equal deck.cards[1].value, '3'
    assert_equal deck.cards[2].suit, :heart
    assert_equal deck.cards[2].value, '4'

    deck.randomize_deck
    # Does not account for all possibilities, but serves its purpose
    card1_match = deck.cards[0].suit == :heart && deck.cards[0].value == '2'
    card2_match = deck.cards[1].suit == :heart && deck.cards[1].value == '3'
    card3_match = deck.cards[2].suit == :heart && deck.cards[2].value == '4'

    refute card1_match && card2_match && card3_match
  end

  def test_split_decks
    deck1 = []
    deck2 = []
    deck = Deck.new
    deck.generate_standard_deck
    deck.randomize_deck
    deck.split_deck(deck1, deck2)

    assert_equal deck1.length, 26
    assert_equal deck2.length, 26
  end

end
