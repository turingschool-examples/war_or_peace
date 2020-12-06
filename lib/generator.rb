require './lib/card'

class Generator

  def initialize(filename)
    @file = File.open("./lib/cards.txt") #filename
  end

  def cards
    @file.readlines.map do |card|
      card = card.chomp.split(', ')
      Card.new(card[1].to_sym, card[0], card[2].to_i)
    end
  end
end
