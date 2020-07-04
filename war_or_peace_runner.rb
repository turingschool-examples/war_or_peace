require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'


### Create 52 cards

@deck = []
suits={H: 'Hearts', S:'Spades', D:'Diamonds', C:'Clubs'}
cards_array=['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']

suits.each_key do |suit|
    (2..14).each do |number|
      @deck << Card.new(suit, cards_array[number-2], number)
    end
end

p @deck.count


### Randomize 2 decks of 26

### Create 2 players
