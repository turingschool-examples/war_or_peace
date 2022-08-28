class Deck
  # will need this later, could probably find a much better way to do this
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select { |card| card.rank >= 11 }
  end

  def percentage_high_ranking
    self.high_ranking_cards.length.to_f / @cards.length.to_f
  end

  def remove_card_from_top
    @cards.shift
  end

  def add_card_to_bottom(card)
    @cards.push(card)
  end

  def top
    @cards.first
  end

  def bottom
    @cards.last
  end

  def shuffle
    @cards.shuffle!
    return self
  end

  def print_info
    @cards.each do |card|
      card.print_info
    end
  end
end
