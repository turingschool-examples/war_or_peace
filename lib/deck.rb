class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
    # this method will take one argument
    # that represents the index location of
    # a card to be used and will return the
    # rank of that card
  end

  def high_ranking_cards
  end

  def percent_high_ranking
  end

  def remove_card
  end

  def add_card
  end

end
