class Card
  attr_reader :suit,
              :value,
              :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  #This is what attr_reader is doing
  # def rank
    # @rank
  # end
end
