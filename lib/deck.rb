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

#method that returns the percentage of cards that are high ranking
  def percent_high_ranking

    count_high = 0

    cards.each do |card|

      if card.rank >= 11
        count_high += 1
      end

    end


    count_high_f = count_high.to_f
    count_total = cards.length
    count_total_f = count_total.to_f

    (100 * (count_high_f/count_total_f)).round(2)

  end

#method that removes the top card from the deck
  def remove_card
    @cards.shift

  end

#method that adds one card to the bottom (end) of the deck
  def add_card(card)
    @cards << card
  end

end
