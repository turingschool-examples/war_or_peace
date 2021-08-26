require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'

cards = []

values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
suits = [:diamond, :heart, :spade, :club]

suits.each do |suit|
  values.size.times do |value|
    cards << Card.new(suit, values[value], value + 2)
  end
end

#Return to this... how do I randomize them?
deck1 = Deck.new(cards[0..25])
deck2 = Deck.new(cards[26..51])

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

game = Game.new(player1, player2)
game.start
