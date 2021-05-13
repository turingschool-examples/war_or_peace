class Deck
  attr_accessor :cards
  def initialize(cards)
    @cards = []
  end


 def rank_of_card_at(index)
   cards[index].rank
 end

 def add_card(card)
   @cards << card
 end
end
