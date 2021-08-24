class Deck
  attr_reader :cards

  def initialize(cards)
    @deck = [cards]
  end

  def rank_of_card_at(cut)
    @deck.index(cut).rank
  end

  def high_ranking_cards
    face_cards = @deck.select {|rank| rank = 11}
  end

  def percent_high_ranking
    percentage = ((high_ranking_cards / @deck.length) * 100).to_i
    return percentage
  end

  def remove_card
    @cards.shift(0)
  end

  def add_card(card)
    @cards.push(card)
  end

end
