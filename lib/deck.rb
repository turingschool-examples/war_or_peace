class Deck
  attr_reader :cards, :add_card

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_rank_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_rank_cards << card
      end
    end
    high_rank_cards
  end

  def percent_high_ranking
    percent = ((high_ranking_cards.length.to_f / @cards.length.to_f) * 100).to_i
    percent
  end

  def remove_card
    cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end

end
