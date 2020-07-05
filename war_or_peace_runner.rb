require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'


suits = [:heart, :spade, :diamond, :club]

full_deck = []

suits.each do |suit|
  2.upto(10) do |number|
    full_deck << Card.new(:suit, "#{number}", number)
  end
  full_deck << Card.new(:suit, "Jack", 11)
  full_deck << Card.new(:suit, "Queen", 12)
  full_deck << Card.new(:suit, "King", 13)
  full_deck << Card.new(:suit, "Ace", 14)
end

full_deck.shuffle!

split_deck1 = full_deck [0..25]
split_deck2 = full_deck [26..51]

deck1 = Deck.new(split_deck1)
deck2 = Deck.new(split_deck2)

@player1 = Player.new("Megan", deck1)
@player2 = Player.new("Aurora", deck2)
turn = Turn.new(@player1, @player2)

game = Game.new(@player1, @player2)
game.start
