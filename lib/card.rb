class Card
  attr_reader(:suit, :value, :rank)
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
  def card_suit(suit)
    p "#{suit}"
  end
  def card_value(value)
    p "#{value}"
  end
  def card_rank(rank)
    p "#{rank}"
  end
end

  card = Card.new
