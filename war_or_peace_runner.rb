require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require "pry"

@standard_deck = []
@suits = [:heart, :diamond, :club, :spade]

@suits.each do |suit|
  2.upto(10) do |number|
    standard_deck << Card.new(:suit, "#{number}", number)
  end
  standard_deck << Card.new(:suit, "Jack", 11)
  standard_deck << Card.new(:suit, "Queen", 12)
  standard_deck << Card.new(:suit, "King", 13)
  standard_deck << Card.new(:suit, "Ace", 14)
