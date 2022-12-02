require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


#create 52 cards
cards = []
value = 1
rank = 1

cards << Card.new(:diamond, 'Ace', 1)

9.times do
    suit = :diamond
    value += 1
    rank += 1
    cards << Card.new(suit, value, rank)

end

cards << Card.new(:diamond, 'Jack', 11)
cards << Card.new(:diamond, 'Queen', 12)
cards << Card.new(:diamond, 'King', 13)

value = 1
rank = 1

cards << Card.new(:heart, 'Ace', 1)

9.times do
    suit = :heart
    value += 1
    rank += 1
    cards << Card.new(suit, value, rank)

end

cards << Card.new(:heart, 'Jack', 11)
cards << Card.new(:heart, 'Queen', 12)
cards << Card.new(:heart, 'King', 13)

value = 1
rank = 1

cards << Card.new(:club, 'Ace', 1)

9.times do
    suit = :club
    value += 1
    rank += 1
    cards << Card.new(suit, value, rank)

end

cards << Card.new(:club, 'Jack', 11)
cards << Card.new(:club, 'Queen', 12)
cards << Card.new(:club, 'King', 13)

value = 1
rank = 1

cards << Card.new(:spade, 'Ace', 1)

9.times do
    suit = :spade
    value += 1
    rank += 1
    cards << Card.new(suit, value, rank)

end

cards << Card.new(:spade, 'Jack', 11)
cards << Card.new(:spade, 'Queen', 12)
cards << Card.new(:spade, 'King', 13)

#create two decks w/ random assignment of 26 cards
random_half_1 = cards.sample(26)

random_half_2 = cards


