require './lib/turn'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def cards
    full_deck = []
    File.foreach(@filename) do |line|
    full_deck << line.strip.split("\n")
    end
    full_deck_2 = []
    full_deck.each do |card|
      full_deck_2 << card[0].split(", ")
    end
    full_deck_3 = []
    full_deck_2.each do |array|
      suit = array[1].downcase.to_sym
      value = array[0]
      rank = array[2].to_i
      full_deck_3 << Card.new(suit, value, rank)
    end
    full_deck_3.each do |card|
      @cards << card
    end
    @cards
  end

end
