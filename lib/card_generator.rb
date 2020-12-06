require './lib/card'

class CardGenerator
  attr_reader :filename
              :cards

  def initialize(filename)
    @filename = filename
  end

  def cards
    cards_data = File.read filename
    cards_data.split("\n").map do |line|
      suit, value, rank = line.split(',')
      Card.new(suit.downcase.to_sym, value.strip, rank.to_i)
    end
  end
end
