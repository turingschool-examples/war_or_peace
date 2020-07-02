class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location_of_card)
    if index_location_of_card == 0
      rank = @cards[0].rank
      #realized the below is not needed during 'war'
      #since the second card will be facedown
    elsif index_location_of_card == 1
      rank = @cards[1].rank
    else rank = @cards[2].rank
    end

  end

  def high_ranking_cards
    @cards.select { |card| card.rank > 10}
  end 

  def percent_high_ranking
    #return percentage of cards which rank high
  end

  def remove_card
    #remove card from top of deck
    @cards.drop(1)
  end

  def add_card(card1)
    @cards << card1
  end

end
