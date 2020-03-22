class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    high_ranking_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_ranking_cards << card
      end
    end
    high_ranking_cards
  end

  def percent_high_ranking
    ((high_ranking_cards.length / cards.length.to_f) * 100).round(2)
  end

  def remove_card

   @cards = @cards[1..-1]
  end


end
