class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location_of_card)
    rank = cards.select{|x| if x = @rank then return x end}
  end

  def high_ranking_cards
    #return cards in the deck 11 or above
  end
  def percent_high_ranking
    #return percentage of cards which rank high
  end

  def remove_card
    #remove card from top of deck
  end

  def add_card
    #add one card to the bottom of Deck
  end

end
