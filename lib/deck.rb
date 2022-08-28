class Deck
  attr_reader :cards, :high_rank

  def initialize(cards)
    @cards = cards
    cards = []
  end

  def rank_of_card_at(index_position)
    cards[index_position].rank
  end

  def high_ranking_cards
    @high_rank = high_rank
    high_rank = []
      cards.each do |card|
        if card.rank >= 11
          high_rank << card
        end
      end
    high_rank
  end

  def percent_high_ranking
    high_rank = []
      cards.each do |card|
        if card.rank >= 11
          high_rank << card
        end
      end
    ((high_rank.length * 100.0) / (cards.length * 100.0)) * 100.00.round(2)
    # I realized why it wasn't working!! I was doing bigger number divided by the smaller when its the other way around!
    # it was originally (cards.length % high_rank.length) * 100.0 which always produces 1.5
  end

  def remove_card
    cards.shift
  end

  def add_card(card4)
    @cards << card4
  end
end
