require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = []
  end

  # This method takes one argument that represents the index location of a card
  # to be used and will return the rank of that card.
  def rank_of_card_at
    cards.index
  end

  # This method will return an arry of cards in the deck that have a rank of 11
  # or above (face cards and aces)
  def high_ranking_cards
  end

  # This method will return the percentage of cards that are high ranking
  def percent_high_ranking
  end

  # This method will remove the top card from the deck
  def remove_card
    @cards = cards.shift
  end

  # This method will add one card to the bottom (end) of the deck
  def add_card
    @cards = cards.push
  end
end
