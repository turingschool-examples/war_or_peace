require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require "pry"

# @standard_deck = []
# @suits = [:heart, :diamond, :club, :spade]
#
# @suits.each do |suit|
#   2.upto(10) do |number|
#     @standard_deck << Card.new(:suit, "#{number}", number)
#   end
#   @standard_deck << Card.new(:suit, "Jack", 11)
#   @standard_deck << Card.new(:suit, "Queen", 12)
#   @standard_deck << Card.new(:suit, "King", 13)
#   @standard_deck << Card.new(:suit, "Ace", 14)
# end
#
# @standard_deck.shuffle!
#
# @deck1 = @standard_deck[0..25]
# @deck2 = @standard_deck[26..52]
#
# @player1 = Player.new("Megan", @deck1)
# @player2 = Player.new("Aurora", @deck2)

@game = Game.new(@player1, @player2)
# binding.pry

@game.start
