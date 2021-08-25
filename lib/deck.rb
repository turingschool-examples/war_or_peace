# class with :cards -> an array of cards

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

#method takes the location of the card as index and returns the rank of that card
  def rank_of_cards_at(index)
    return cards[index].rank
  end

#method that returns an array of cards in the deck that have a rank of 11 or above

  def high_ranking_cards

    array_high_cards = []

    cards.each do |card|

      if card.rank >= 11
        array_high_cards << card
      end

    end

    array_high_cards

  end

#XXXmethod that returns the percentage of cards that are high ranking
  def percent_high_ranking

require "pry"; binding.pry

    num_total_cards = cards.length

    array_high_cards = cards.high_ranking_cards

    num_high_cards = array_high_cards.length

    percent = 100 * (num_high_cards/num_total_cards)

    return percent

  end

#XXXmethod that removes the top card from the deck
  def remove_card
    @cards = cards.shift
  end

#XXXmethod that adds one card to the bottom (end) of the deck
  def add_card(card)
    @cards << card
  end

end
