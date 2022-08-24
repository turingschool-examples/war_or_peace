class Deck
  attr_reader :cards, :high_ranked_cards
  # Refactor to only take one argument
  def initialize(cards = [], high_ranked_cards = [])
    @cards = cards
    @high_ranked_cards = high_ranked_cards
  end
  
  def rank_of_card_at(index_position)
    cards[index_position].rank
  end
  
  def high_ranking_cards
    cards.each do |card|
      if card.rank >= 11
        high_ranked_cards << card
      end
    end
    return high_ranked_cards
  end
  
  def percent_high_ranking
    # require 'pry'; binding.pry
    high_ranking_cards
    high_ranked_cards.count / cards.count
  end
  
  def remove_card
    cards.shift
  end
  
  def add_card(card)
    cards.push(card)
  end
end