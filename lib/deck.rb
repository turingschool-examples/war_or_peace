class Deck 
  attr_reader :cards 

  def initialize
    @cards = []
  end 

  def rank_of_card_at(card_name)
    card_name.rank
  end 
end 