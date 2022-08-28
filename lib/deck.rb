class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end


  def rank_of_card_at(index_location)
    @cards[index_location].rank
  end

  def high_ranking_cards
    ranks = []
    cards.each do |card|
      ranks << card if card.rank >= 11
    end
    ranks
  end

  def percent_high_ranking
    high_rank = @cards.count do |card|
      card.rank >= 11
    end
    ((high_rank.to_f / @cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end 
