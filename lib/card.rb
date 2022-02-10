class Card
  attr_reader :suit, :value, :rank

  def initialize(s, v, r)
    @suit = s
    @value = v
    @rank = r
  end

end
