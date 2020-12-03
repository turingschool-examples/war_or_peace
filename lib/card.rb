class Card
  attr_reader :suit, :value,:rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
  def suit
    suit = [:diamond, :heart, :club, :spade]
  end
  def value
    value = ["2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"]
  end
  def rank
    rank = [2,3,4,5,6,7,8,9,10,11,12,13,14]
  end
end
