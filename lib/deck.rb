class Deck
  attr_reader :cards #Array of Card objects
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(i)
    @cards[i].rank
  end

  def high_ranking_cards

    @cards.drop_while{|card| card.rank < 11}

  end

  def percent_high_ranking
    (self.high_ranking_cards.length.to_f / @cards.length.to_f) * 100
  end

  def remove_card
    @cards.pop
  end

  def add_card(card)
    @cards.push(card)
  end


end
