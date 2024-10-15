class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    cards = []
  end

  def rank_of_card_at()
    rank_of_card_at = cards.at()
  end
  
  def high_ranking_cards #works
    cards.find_all do |card|
      card.rank >= 11
    end
  end
  
  def percent_high_ranking
    cards_total = cards.length
    high_ranking_total = high_ranking_cards.length
  end
  
  def remove_card #works
    remove_card = cards.shift
  end
  
  def add_card()
    add_card = cards.push()
  end
end
