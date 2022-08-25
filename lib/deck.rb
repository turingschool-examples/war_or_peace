class Deck 
  attr_reader :cards, :high_ranking_card, :percent_high_ranking

  def initialize(cards)
    @cards = cards
  end 

  def rank_of_card_at(index)
    @cards[index].rank
  end 

  def high_ranking_card
    high_cards = []
    @cards.each do |card| 
      if card.rank >= 11
        high_cards << card
      end 
    end
    high_cards
  end
  
  def percent_high_ranking
    high_cards = []
    @cards.each do |card| 
      if card.rank >= 11
        high_cards << card
      end 
    end

    percent = ((high_cards.length.to_f / @cards.length.to_f) * 100).to_i
    percent

    # percent = ((@cards.high_ranking_card.length.to_f / @cards.length.to_f) * 100).to_i
    # percent
  end 

  def remove_card 
    @cards.shift
  end 

  def add_card(card)
    @cards << card
  end
end 