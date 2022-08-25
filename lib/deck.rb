class Deck 
  attr_reader :cards

  def initialize(cards) 
    @cards = cards 
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    (high_ranking_cards.length.to_f / @cards.length.to_f * 100).round(2)
  end

  def remove_card
    @cards.shift 
  end

  def add_card(card)
    @cards.push(card)
  end
end




 # last_digit = (high_ranking_cards.length / @cards.length.to_f * 100).to_s.slice(-1).to_i
    # if last_digit >= 5
    #   (high_ranking_cards.length / @cards.length.to_f * 100).ceil(2)
    # else 
    #   (high_ranking_cards.length / @cards.length.to_f * 100).floor(2)
    # end