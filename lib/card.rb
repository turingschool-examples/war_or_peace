class Card
  attr_reader :suit, :rank, :value
  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @value = value
  end
  # def suit(suit)
  #   @suit = [:spade, :heart, :diamond, :club]
  # end
  # def rank(rank)
  #   @rank = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  # end
  # def value(value)
  #   @value = [1..13]
  # end
end
card = Card.new(:diamond, 'Queen', 12)
p card
