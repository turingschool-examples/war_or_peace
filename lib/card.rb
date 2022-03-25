class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
# ----- ATTEMPT -----
  # Code for attempt at making card class carry all arrays for deck & game.
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
p card.suit
p card.value
p card.rank
