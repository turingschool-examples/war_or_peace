require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'



suits = %i[spades hearts diamonds clubs]
ranks = %i[Ace two three four five six seven eight nine ten Jack Queen King]
values = {
  :Ace => 1,
  :two => 2,
  :three => 3,
  :four => 4,
  :five => 5,
  :six => 6,
  :seven => 7,
  :eight => 8,
  :nine => 9,
  :ten => 10,
  :Jack => 11,
  :Queen => 12,
  :King => 13
}


fdeck = ranks.map {|rank| suits.map {|suit| values.map{ |rank, value| Card.new(suit, value, rank)  }  } }.flatten
full_deck = fdeck.take(52)

shuffled_deck = full_deck.shuffle
shuffled_deck
#
#
deck1 = Deck.new(shuffled_deck.take(26))
deck2 = Deck.new(shuffled_deck.drop(26))

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

class Game
  attr_accessor :player1, :player2, :turn_number, :turn
  $turn_number = 0

  def initialize
    turn = Turn.new(player1, player2)
  end

  def start
    $turn_number += 1
  end

  def type
    turn.type
  end
end

puts "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Megan and Aurora. Type 'GO' to start the game!"
p '------------------------------------------------------------------'

if gets.chomp! == 'GO'
  george = Game.new
  george.start
  turn = Turn.new(player1, player2)
  p "Turn #{$turn_number}: #{turn.type} won"
end
