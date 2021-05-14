class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = []
  end

  def rank_of_card_at(value)
    (value, rank)
    p rank
  end

  def high_ranking_cards
    @cards.find_all do |number|
      number.rank >= 11
  end

  def percent_high_ranking
    @cards.map do |number|

  end
  #
  def remove_card
  end

  def add_card
  end

end

class Card
  attr_reader :suite, :value, :rank

  def initialize(suite, value, rank)
    @suite = suite
    @value = value
    @rank = rank
  end
end
