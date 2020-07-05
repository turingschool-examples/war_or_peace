require './lib/deck'
require './lib/card'
require './lib/game'


cards_import = IO.readlines("lib/cards.txt", chomp: true)

@cards_array = []

cards_import.each do |card|
  @cards_array << card.split(/, /)
end

@cards = []

@cards_array.each do |index|
     @cards << Card.new(index[1], index[0], index[2])
end

@deck = Deck.new(@cards)

p @deck
