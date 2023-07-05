class Deck

  attr_reader :cards
  def initialize(cards = [])
    @cards = cards 
  end

  def rank_of_card_at(position)
    if @cards[position].nil?
      0
    else 
      @cards[position].rank
    end 
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    average = high_ranking_cards.length.to_f * 100 / @cards.length.to_f
    average.round(2)
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(card)
    @cards << card
  end
end