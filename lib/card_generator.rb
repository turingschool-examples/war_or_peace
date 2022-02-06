require './lib/card.rb'
require 'pry'

cards_for_deck = File.read("lib/cards.txt") #creates a string object of card info separated by /n new lines.
cards_for_deck = cards_for_deck.lines #partitions string into array elements, 1 element for each line in the file
element = 0 #initialize counter to access current element in cards_for_deck
cards_for_deck.each do |line| #for each element,
  cards_for_deck[element] = line.chomp #chomp the new line character
  element += 1 #increment counter
end
# p cards_for_deck #double check
