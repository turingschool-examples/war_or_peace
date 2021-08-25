class Card
  attr_accessor :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

Jack_of_Hearts = Card.new('Heart', 'Jack', 11)
