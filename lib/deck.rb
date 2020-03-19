class Deck
  def initialize(cards)
    @cards = cards
  end

  attr_reader :cards

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    high_cards = []
    #return an array cards rank equal to 11 or higher
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
  end

  def remove_card
    cards.drop(1)
  end

  def add_card(card)
    cards.push(card)
  end


end
