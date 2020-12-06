require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'

def create_deck
  suits = [:heart, :spade, :diamond, :club]
  deck = []
  suits.each do |suit|
