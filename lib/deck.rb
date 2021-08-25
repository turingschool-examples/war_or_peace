class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(number)
    @cards.fetch(number).rank
  end

  def high_ranking_cards
    @cards.select {|card| card.rank >= 11  }

  end




  def percent_high_ranking
    p (16.0 / 52) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card
    @cards.push
  end

end
