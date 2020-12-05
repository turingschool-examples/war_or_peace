require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

suits = ["heart", "diamond", "club", "spade"]

val_and_rank = {1 => "Ace", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9", 10 => "10", 11 => "Jack", 12 => "Queen", 13 => "King"}

cards1 = []

cards2 = []

suits.each do |suit|
  val_and_rank.each do |rank, val|
    cards1 << Card.new(suit, val, rank)
  end
end

cards1.shuffle!

cards2 << cards1.shift(26)

cards2.flatten!

cards1.shuffle!
cards2.shuffle!


deck1 = Deck.new(cards1.shuffle!)
deck2 = Deck.new(cards2.shuffle!)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

# turn = Turn.new(player1, player2)

game = Game.new(player1, player2)

game.start
