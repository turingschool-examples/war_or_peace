require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

# Create 52 Cards and shuffle
deck = []
suits = [:club, :diamond, :heart, :spade]

4.times do |suit|
    9.times do |value|    
        deck << Card.new(suits[suit], (value + 2).to_s, value + 2)
    end

    deck << Card.new(suits[suit], "Jack", 11)
    deck << Card.new(suits[suit], "Queen", 12)
    deck << Card.new(suits[suit], "King", 13)
    deck << Card.new(suits[suit], "Ace", 14)
end

deck.shuffle!
