class Deck

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank > 10
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank > 10
        high_cards << card
      end
    end
    high_cards.count / cards.count
  end

  def remove_card
    cards.shift
  end

end




# remove_card (from top of deck)
# add_card (to bottom of deck)
