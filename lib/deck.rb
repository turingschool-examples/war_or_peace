require './lib/card'
class Deck
  attr_reader :cards, :high_ranking_cards

  def initialize(cards)
    @cards = cards
  end

  # This method takes one argument that represents the index location of a card
  # to be used and will return the rank of that card.
  # index is a placeholder for the "card position"
  def rank_of_card_at(index)
    @cards[index].rank
  end

  # This method will return an arry of cards in the deck that have a rank of 11
  # or above (face cards and aces)
  def high_ranking_cards
    @cards.find_all do |high_rank|
      high_rank.rank >= 11
    end
  end

  # This method will return the percentage of cards that are high ranking
  # // need to find the total amount in the array .length or .count enumerable
  def percent_high_ranking
    (self.high_ranking_cards.length.fdiv(@cards.length) * 100).round(2)
  end

  # This method will remove the top card from the deck
  def remove_card
    @cards.shift
  end

  # This method will add one card to the bottom (end) of the deck
  def add_card(new_card)
    @cards << new_card
  end
end
