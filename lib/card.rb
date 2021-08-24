class Card
  attr_reader :suit,
              :value,
              :rank

  def initialize(suit_parameter, value_parameter, rank_parameter)
    @suit     = suit_parameter
    @value    = value_parameter
    @rank     = rank_parameter
  end

end
