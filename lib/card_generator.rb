require './lib/turn'

class CardGenerator
  attr_reader :filename,
              :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def import_cards
    deck_string_array = []
    File.foreach(@filename) do |line|
      deck_string_array << line.strip.split("\n")
    end
    split_string_array = []
    deck_string_array.each do |card|
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
