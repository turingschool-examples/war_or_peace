class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    high_ranks = high_ranking_cards.count
    percent = high_ranks.to_f / @cards.count * 100
    percent.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

  def add_cards(array)
    @cards += array
  end
end
