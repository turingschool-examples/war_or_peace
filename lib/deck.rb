class Deck
  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if cards[index].nil? == true
      return 0
    else cards[index].rank
    end
  end



  def high_ranking_cards
    cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
      percentage = (high_ranking_cards.length.to_f / cards.length).round(2)
      percentage * 100
  end

  def remove_card
    cards.shift
  end

  def add_card(new_card)
    cards.append(new_card)
  end
end
