class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end
  def rank_of_card_at(index_position)
    cards[index_position].rank
  end
  def high_ranking_cards
    high_rank = []
      cards.each do |card|
        if card.rank >= 11
          high_rank << card
        end
      end
    high_rank
  end

  def percent_high_ranking
    require 'pry'; binding.pry
  end
  def remove_card

  end
  def add_card
  end
end
