class Deck
  attr_reader :cards

  initialize(array_of_cards)
    @array_of_cards = array_of_cards
  end
  def rank_of_card_at(location)
    @location = location
  end
  def high_ranking_cards(array_of_cards)
    bigcards = []
    (array_of_cards).each do
     if rank => 11
       array.push(card)
     else
     end
    return bigcards
  end
  def percent_high_ranking(array_of_cards)
  end
  def remove_card(oldcard)
    array.shift(oldcard)
  end
  def add_card(newcard)
    array.push(newcard)
  end
end
