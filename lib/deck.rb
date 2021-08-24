require './card'

class Deck
  attr_reader :cards

  def initialize(card_parameter)
      @cards = card_parameter
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards

    high_cards = []

      cards.each do | i |

      if i.rank >= 11
        high_cards << i
      end

    end

    return high_cards
  end

  def percent_high_ranking
    percent = (high_ranking_cards.count.to_f) / (cards.count.to_f)
    return percent.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end
end
