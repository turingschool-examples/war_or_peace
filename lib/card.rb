# a single card

class Card
    # The next line will have the same function as:
    # def <method> 
    #     @<attribute>
    # end
attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end
