require './lib/card'
require './lib/deck'
require './lib/player'
require  './lib/turn'
require  './lib/game'


turn_counter = 0
#lay out card suits, values, and ranks
suit = [:hearts, :spades, :diamonds, :clubs]
value = ["Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
"Ten", "Jack", "Queen", "King", "Ace"]
rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
#build deck *no idea how to build the deck*
group = suit.flat_map {|suit| value.flat_map {|value| rank.flat_map {Card.new(suit, value, rank)}}
#cards1 = deck build
cards1.shuffle!
#split the deck and create decks
cards2 = cards1.shift(26)
deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)
#create players
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
#create turn
turn = Turn.new(player1, player2)

game = Game.new(turn)

game.start

reply = gets.chomp.upcase
if reply = "GO"
  puts


#game mechanics

turn.type

turn.winner

turn.pile_cards

turn.award_spoils(winner)

p ""



#start code
def start




turn_counter = 1

  until player1.has_lost?  || player2.has_lost?
   if

   elseif turn_counter == 1000000
   p "---- DRAW ----"
  end
