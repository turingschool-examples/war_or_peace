require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

## Welcome
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "the players today are Megan and Aurora."

@deck = []
suits=['Hearts', 'Spades', 'Diamonds', 'Clubs']
cards_array=['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
## Create Cards
suits.each do |suit|
    (2..14).each do |number|
      @deck << Card.new(suit, cards_array[number-2], number)
    end
end
## Create Deck
@deck = @deck.shuffle
@deck1 = Deck.new(@deck[0..25])
@deck2 = Deck.new(@deck[26..51])

## Create Players
@player1 = Player.new('Megan', @deck1)
@player2 = Player.new('Aurora', @deck2)
