require './lib/turn'

class CardGenerator
  attr_reader :filename,
              :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def import_cards
    string_array_deck = []
    File.foreach(@filename) do |line|
      string_array_deck << line.strip.split("\n")
    end
    split_string_array = []
    string_array_deck.each do |card|
      split_string_array << card[0].split(", ")
    end
    object_deck = []
    split_string_array.each do |array|
      suit = array[1].downcase.to_sym
      value = array[0]
      rank = array[2].to_i
      @cards << Card.new(suit, value, rank)
    end
    @cards
  end

end
