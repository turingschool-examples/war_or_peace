#require '.,=/card'

class Deck
  attr_reader :cards,
              :card,
              :high_ranking_cards,
              :suit,
              :rank,
              :value

#    @suit = ["diamonds", "spades", "hearts", "clubs"]
#    @value = [0...14]
#    @rank = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14"]
#  end

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location_of_card)
    cards[index_location_of_card].rank
  end

  high_cards= []

  def high_ranking_cards
      cards.each do |cards|
      if cards.rank > 11
        high_cards << cards
      else
      end
  end

end
#return an array of cards in the deck that have a rank of 11 or above (face cards and aces)|

#  def percent_high_ranking
    #this method will return the percentage of cards that are high ranking

#  def remove_card
    #this method will remove the top card from the deck

#  def add_card
    #this method will add one card to the bottom (end) of the deck
end

#card_1 = Card.new('club', 1, "2")
