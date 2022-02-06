require './lib/card.rb'
require 'pry'

def get_cards
  cards_for_deck = File.read("lib/cards.txt") #creates a string object of card info separated by /n new lines.
  cards_for_deck = cards_for_deck.lines(chomp: true) #partitions string into array elements, 1 element for each line in the file, AND chomps the line break
  element = 0 #initialize counter to access current element in cards_for_deck

  cards_for_deck.each do |card| #for each element,
    cards_for_deck[element] = card.lines(", ") #makes each array element a 3 element array, 0=value, 1=suit, 2=rank
    element += 1 #increment counter
  end

  element = 0 #reset counter
  cards_for_deck.each do |card| #for each unformatted card,
    card[1].to_sym #convert suit to symbol
    card[2].to_i #convert rank to integer
    cards_for_deck[element] = card #save changes made to cards_for_deck
  end

  new_cards = [] #prepare an array to recieve our Card objects
  cards_for_deck.each do |card| #for each card array in this array,
    new_card = Card.new(card[1], card[0], card[2]) #use the elements of the element to create a new Card object
    new_cards << new_card  #shovel that Card to a new_cards array
  end
  return new_cards 
end
