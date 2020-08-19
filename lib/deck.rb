
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards

  end

  def high_ranking_cards
    high_cards = Array.new
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    percent = ((high_ranking_cards.count.to_f.round(2) / @cards.count.to_f.round(2)) * 100)
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(new_card)
    @cards << new_card
    @cards
  end

end
