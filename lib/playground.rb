require 'csv'
card = Card.new(require './lib/card_generator'
#load './lib/cards.txt'


card1 = Card.new('2', 'Heart', 2)
card2 = Card.new('3', 'Heart', 3)
card3 = Card.new('4', 'Heart', 4)
card3 = Card.new('5', 'Heart', 5)
card5= Card.new('6', 'Heart', 6)
card6 = Card.new('7', 'Heart', 7)
card7 = Card.new('8', 'Heart', 8)
card8 = Card.new('9', 'Heart', 9)
card9 = Card.new('0', 'Heart', 10)
card10 = Card.new('Jack', 'Heart', 11)
card11= Card.new('Queen', 'Heart', 12)
card12 = Card.new('King', 'Heart', 13)
card13 = Card.new('Ace', 'Heart', 14)

cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13]


# deck_array = []
#
#
# card_generator.each do |item|
#   deck_array << Card.new(item.join)
# end
#
# puts deck_array




# File.open("cards.txt").each do |line|
#   deck_array << Card.new(line)
# end
#
# p deck_array


# file = CSV.parse(File.read("cards.txt"), headers: false)
# file.each do |line|
#   puts line
# end
