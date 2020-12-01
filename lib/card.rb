class Card
  attr_reader(:suit, :name, :number)

  def initialize(suit, name, number)
    @suit = suit
    @name = name
    @number = number
  end
end
