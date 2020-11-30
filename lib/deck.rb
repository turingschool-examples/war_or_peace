class Deck 
  attr_reader :cards 

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card(index)
    cards[index].rank
  end
end