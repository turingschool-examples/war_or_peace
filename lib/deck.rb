

class Deck

  attr_reader :cards, :rank_of_card_at, :high_ranking_cards, :percent_high_ranking
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @rank_of_card_at = cards[index].rank
  end

  def high_ranking_cards
    big_cards = [] #must define before each loop
    @cards.each do |card|
      if card.rank >= 11
        big_cards << card
      end
    end
    return big_cards
  end

  def percent_high_ranking
    # big_cards= high_ranking_cards
    num_high = high_ranking_cards.count
    num_tot = cards.count
    @percent_high_ranking = num_high/num_tot
  end

  def remove_card
    cards.shift #shows removed cards if no return cards
  end

  def add_card(new_card)
    @cards << new_card
  end
end
