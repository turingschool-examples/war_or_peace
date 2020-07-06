require './lib/card'

class Card_Generator
  attr_reader :cards
  def initialize(filename)
    @cards = create_cards(filename)
  end

  def create_cards(filename)
    File.open("lib/#{filename}").map do |line|
      cardData = line.gsub("\n",'').split(',')
      value = cardData[0]
      suit = cardData[1]
      rank = cardData[2].to_i
      Card.new(suit, value, rank)
    end
  end
end
