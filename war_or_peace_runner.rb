require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/turn'
require_relative 'lib/game'

# Define suits and values for the standard deck
suits = [:heart, :diamond, :club, :spade]
values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
ranks  = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]


cards = []    # Create all 52 cards 
suits.each do |suit|
  values.each_with_index do |value, index|
    cards << Card.new(suit, value, ranks[index])
  end
end

cards.shuffle!  # Shuffle the deck

deck1 = Deck.new(cards[0..25])
deck2 = Deck.new(cards[26..51])

player1 = Player.new("Megan", deck1) 
player2 = Player.new("Aurora", deck2)  

game = Game.new(player1, player2) #starts the game
game.start

