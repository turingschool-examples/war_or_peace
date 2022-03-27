class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end


#everyting assigned to suit, value, rank will be attached to it through the attr_reader
#when I call new like Card.new ruby calls initialize
#initialize allows me to create objects with arguments
#use instance variables @suit, @rank... so I can access the values of (suite, and rank) later
