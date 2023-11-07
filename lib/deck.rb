class Deck
  attr_reader :cards 

  def initialize(cards)
    @cards = cards
  end
  
  def rank_of_card_at(index)
    cards[index].rank
  end
  
  def high_ranking_cards
    high_rank_cards = []
    cards.find_all do |card|
      if card.rank >= 11
        high_rank_cards << card
      end
    end
    high_rank_cards 
  end
  
  def percent_high_ranking
    ((self.high_ranking_cards.count.to_f / cards.count.to_f).round(4)) * 100
  end

  def remove_card
    cards.delete_at(0)
    cards
  end
  
  def add_card(card)
    cards.unshift(card)
  end
end