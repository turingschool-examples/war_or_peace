class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank) #instance variables == right side of below
    @suit = suit
    @value = value
    @rank = rank
  end
end



# face = value
# num = rank
# face can be nil/empty/nothing if num < 11 or num > 1
# suit  is constant, always 1 of 4
# suits have either a face or a number
# king 'k' == 13 == face
# queen 'q' == 12 == face
# jack "j" == 11 == face
# ace 'a' == 1 == face
