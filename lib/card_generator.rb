require './lib/card.rb'
require 'pry'

cards_for_deck = File.read("lib/cards.txt") #creates a string object of card info separated by /n new lines.
cards_for_deck = cards_for_deck.lines
element = 0
cards_for_deck.each do |line|
  cards_for_deck[element] = line.strip
  element += 1
end
p cards_for_deck
