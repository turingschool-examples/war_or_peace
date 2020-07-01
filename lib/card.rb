class Card
attr_reader :suit, :value, :rank

  def initialize(suit_param, value_param, rank_param)
    @suit = suit_param
    @value = value_param
    @rank = rank_param
  end
end
