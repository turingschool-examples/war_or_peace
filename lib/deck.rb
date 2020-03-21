class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    high_rank_percentage = []
    cards.each do |card|
      if card.rank >= 11
        high_rank_percentage << card
      end
    end
    (high_rank_percentage.count.to_f / cards.count.to_f * 100).round(2)
#could change to high_ranking_cards could get rid percent_high_ranking
  end


  def remove_card
    cards.shift
    #want to remove first item in the array
    #look into method .shift
  end

  def add_card(card)
    cards.push(card)
  end

#ruby convention use @ instance variable instead of attr_reader

end
