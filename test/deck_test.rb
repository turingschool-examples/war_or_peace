require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest


#initialize: this method will take one argument - an array of cards.
  def test_it_exists
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

#cards: an attr_reader to read the @cards attribute


#rank_of_card_at: this method will take one argument that represents the index location of a card to be used (typically 0 or 2 more on this later 😉 ) and will return the rank of that card
  def test_it_can_rank_card_at

#high_ranking_cards: this method will return an array of cards in the deck that have a rank of 11 or above (face cards and aces)

#percent_high_ranking: this method will return the percentage of cards that are high ranking

#remove_card: this method will remove the top card from the deck

#add_card: this method will add one card to the bottom (end) of the deck

end
