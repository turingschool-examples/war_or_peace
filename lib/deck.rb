class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    cards = []
  end

  def rank_of_card_at(index)
    @cards.at(index)
  end
  
  def high_ranking_cards #works
    @cards.find_all do |card|
      card.rank >= 11
    end
  end
  
  def percent_high_ranking
    cards_total = cards.length
    high_ranking_total = high_ranking_cards.length
    (((high_ranking_total)/(cards_total))*100)
  end
  
  def remove_card #works
    @cards.shift
  end
  
  def add_card(new_card)
    @cards.push(new_card)
  end
end
