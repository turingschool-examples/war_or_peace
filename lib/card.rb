class Card
  attr_reader   :suit,
                :value,
                :rank

  def initialize(suit, value, rank)
    @suit   = suit
    @value  = value
    @rank   = rank
  end
end

card = Card.new(:heart, '2', 2)
card = Card.new(:heart, '3', 3)
card = Card.new(:heart, '4', 4)
card = Card.new(:heart, '5', 5)
card = Card.new(:heart, '6', 6)
card = Card.new(:heart, '7', 7)
card = Card.new(:heart, '8', 8)
card = Card.new(:heart, '9', 9)
card = Card.new(:heart, '10', 10)
card = Card.new(:heart, 'Jack', 11)
card = Card.new(:heart, 'Queen', 12)
card = Card.new(:heart, 'King', 13)
card = Card.new(:heart, 'Ace', 14)

card = Card.new(:diamond, '2', 2)
card = Card.new(:diamond, '3', 3)
card = Card.new(:diamond, '4', 4)
card = Card.new(:diamond, '5', 5)
card = Card.new(:diamond, '6', 6)
card = Card.new(:diamond, '7', 7)
card = Card.new(:diamond, '8', 8)
card = Card.new(:diamond, '9', 9)
card = Card.new(:diamond, '10', 10)
card = Card.new(:diamond, 'Jack', 11)
card = Card.new(:diamond, 'Queen', 12)
card = Card.new(:diamond, 'King', 13)
card = Card.new(:diamond, 'Ace', 14)

card = Card.new(:clubs, '2', 2)
card = Card.new(:clubs, '3', 3)
card = Card.new(:clubs, '4', 4)
card = Card.new(:clubs, '5', 5)
card = Card.new(:clubs, '6', 6)
card = Card.new(:clubs, '7', 7)
card = Card.new(:clubs, '8', 8)
card = Card.new(:clubs, '9', 9)
card = Card.new(:clubs, '10', 10)
card = Card.new(:clubs, 'Jack', 11)
card = Card.new(:clubs, 'Queen', 12)
card = Card.new(:clubs, 'King', 13)
card = Card.new(:clubs, 'Ace', 14)
