require './lib/card'

class CardGenerator
  attr_reader :cards, :formatted_card_data
  def initialize
    filename = File.read("./lib/cards.txt")
    raw_card_data = filename.gsub("\n", ", ")
    @formatted_card_data = raw_card_data.split(", ")
    @cards = []

    formatted_card_data.each do |card|
     value = formatted_card_data[0]
     suit = formatted_card_data[1].to_sym
     rank = formatted_card_data[2].to_i
     card = Card.new(suit, value, rank)
     @cards << card
     3.times do
       formatted_card_data.shift
     end
   end
 end
end
