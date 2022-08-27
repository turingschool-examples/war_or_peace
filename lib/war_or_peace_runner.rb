require 'rspec'
require './card'
require './deck'
require './player'
require './turn'
require './game'

suits = [:heart, :diamond, :spade, :club]
values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1]

cards = []
suits.each do |suit|
  values.each do |value|
    # cards << [suits: suit, values: value, ranks: ranks[values.find_index(value)]]
    card1 = Card.new(suit, value, ranks[values.find_index(value)])
    cards << card1 

  end

end

two_decks = []
two_decks = cards.shuffle.each_slice(26).to_a


deck1 = Deck.new(two_decks[0])
deck2 = Deck.new(two_decks[1])
# require 'pry'; binding.pry 
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)


# puts deck1[0] 
# puts player1 
 
turn = Turn.new(player1, player2)  
game1 = Game.new(turn)
game1.start 
 


