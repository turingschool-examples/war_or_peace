class Card
  attr_reader :suit, :value, :rank

  def initialize (suit = "", value = "", rank = 0)
    @suit = suit
    @value = value
    @rank = rank
  end

  def deal_cards
    p "hi"
  end

end
