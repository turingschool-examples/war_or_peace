class Card
attr_reader :suit, :value, :rank
def initialize(suit, value, rank)#parameters for any future Card.new
@suit = suit#the value of the attribute = the variable that I give it
@value = value
@rank = rank
end
end
#says I HAVE a card and the instance
#of the card class would be any Card.new
