class Deck
  attr_reader :cards, :deck
  
  
  def initialize(cards)
    
    @cards = cards
  end

  def rank_of_card_at(index)
    if cards[2] == nil 
      1
    else 
      @cards[index].rank
    end     
  end
  # cards.rank_of_card_at(1)

  def high_ranking_cards
    high_rank = []
    
    @cards.each do |card|
      if  card.rank >= 11
        high_rank.push(card) 
      end
    end
    return high_rank
  end
    
  def percent_high_ranking
    
    (((high_ranking_cards.count).to_f / cards.count) * 100).round(2)
  end
  
  def remove_card
    cards.shift
    
  end  
  
  def add_card(card)
    cards.push(card)
    
  end  
  
    
end  
