class Deck
  attr_reader :cards
  def initialize (cards)
    @cards = cards
  end

#Method takes one argument representing index location of a card to be used and will return that rank of cards.
  def rank_of_card_at(index)
    @cards[index].rank
  end



#Method will return an array of cards in the deck that have a rank of 11 or above (faces and aces)
  # def high_ranking_cards
  #   #need to reassign ace and face cards to integers
  #   if Card.rank => 11, 12, 'Ace', 'Jack', 'Queen', 'King'
  #   return new_array << []
  # end

#Method will return the percentage of cards that are high ranking
  # def percent_high_ranking
  #   (  /total)* 100
  # end

#Method will return top card from the deck.
  # def remove_card
  #
  # end
#Method will add one card to the bottom (end) of the deck.
  # def add_card
  #
  # end

end
