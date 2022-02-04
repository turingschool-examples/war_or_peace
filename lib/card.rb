
class Card

  attr_reader :suit, :value, :rank

 def initialize (card_suit, card_value, card_rank)
    @suit = card_suit
    @value = card_value
    @rank = card_rank
  end

   attr_reader :suit, :value, :rank

  def initialize (card_suit, card_value, card_rank)
     @suit = card_suit
     @value = card_value
     @rank = card_rank
   end

end
