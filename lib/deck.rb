class Deck
  attr_reader :cards
  
  def initialize(cards = [])
    @cards = cards
  end
  
  def rank_of_card_at(index_position)
    cards[index_position].rank
  end
end