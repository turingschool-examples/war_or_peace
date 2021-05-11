class Card
  attr_reader :suit, :value, :rank

  def initialize(suit=:joker, value='Joker', rank=0)
    @suit = suit.to_s.to_sym
    @value = value.to_s.capitalize
    @rank = rank.to_s.to_i
  end

end
