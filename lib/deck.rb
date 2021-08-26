class Deck
  attr_reader   :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location)
    return cards[index_location].rank
  end

  def percent_high_ranking    #calculate high ranking cards / card count

  end

  def remove_card
    cards.shift
  end

  def add_card
    cards.push(new_card)
  end

end
