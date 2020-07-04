require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

## Welcome
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."

### Build Deck
@deck = []
suits=['Hearts', 'Spades', 'Diamonds', 'Clubs']
cards_array=['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
## Create Cards
suits.each do |suit|
    (2..14).each do |number|
      @deck << Card.new(suit, cards_array[number-2], number)
    end
end

@deck = @deck.shuffle!
@deck1 = Deck.new(@deck[0..25])
@deck2 = Deck.new(@deck[26..51])

## Create Players
@player1 = Player.new('Megan', @deck1)
@player2 = Player.new('Aurora', @deck2)
@turn = Turn.new(@player1, @player2)

@game = Game.new(@turn)

@game.start

counter = 1
while counter < 1000000 && @player1.has_lost? == false && @player2.has_lost? == false

### TEST BLOCK
p "#{@turn.player1.name} with #{@turn.player1.deck.cards[0].rank} vs #{@turn.player2.name} with #{@turn.player2.deck.cards[0].rank}"
p "Deck 1 = #{@turn.player1.deck.cards.count}, Deck 2 = #{@turn.player2.deck.cards.count}"
p @turn.player1.deck.cards & @turn.player2.deck.cards
###
  if @turn.type == :basic
    p "Turn #{counter}: #{@turn.winner.name} won 2 cards"
  elsif @turn.type == :war
    p "Turn #{counter}: WAR - #{@turn.winner.name} won 6 cards"
  else
    p "*mutually assured destruction* 6 cards have been removed from play"
  end

  @turn.pile_cards

## Pry
#require "pry"; binding.pry

  @turn.award_spoils
  counter = counter + 1
end

if counter == 1000000 && @player1.has_lost? == false && @player2.has_lost? == false
  p "---- DRAW ----"
elsif @player1.deck.cards.count > @player2.deck.cards.count
  p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
  else
    p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
end
