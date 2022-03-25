require "./lib/card"

class CardGenerator

  attr_reader :cards

  def initialize(filename)
    @filename = filename
    @cards = []
    create_cards
  end

  #Read the file and create the card objects from it
  def create_cards
    file = File.open(@filename)
    #Read in each line from the file to an array and remove the newline character at the end
    cards_strings_array = file.readlines.map{|c| c.chomp}
    #Go through each string representation of a card and turn it into a card object
    cards_strings_array.each do |card_string|
      card_attr = card_string.split(",")
      value = card_attr[0]
      suit = card_attr[1].strip.to_sym
      rank = card_attr[2].to_i
      @cards << Card.new(suit, value, rank)
    end
    file.close
  end

end
