require 'csv'

class CardGenerator
  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    @cards = []
    file = CSV.read(filename)
    file.each do |card|
      new_card = Card.new(card[1].strip.downcase.to_sym, card[0], card[2].strip.to_i)
      @cards << new_card
    end
  end
end
