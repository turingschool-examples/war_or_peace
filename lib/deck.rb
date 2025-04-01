class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    # add a safeguard against an out-of-bounds index error "NoMethodError: undefined method `rank` for nil:NilClass"
    # which happens if players have fewer than the number of cards required to determine turn type
    return 0 if @cards[index].nil?
    @cards[index].rank
  end 

  def high_ranking_cards
    @cards.find_all { |card| card.rank >= 11 }
  end
  
  def percent_high_ranking
    ((high_ranking_cards.count.to_f / @cards.count) * 100).round(2)
  end
  
  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
  
end