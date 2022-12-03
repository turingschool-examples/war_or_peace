require './lib/card.rb'
require './lib/deck.rb'



class CardGenerator
  attr_reader :filename, :deck

  def initialize(filename)
    @filename = filename 
    @file = File.open("./lib/#{filename}", "r")
    @deck = []
  end

  def cards
    @file.read.lines.each do |precard|
      card = precard.gsub(/\n/, '')
      card_array = card.split(', ')
      @deck << Card.new(card_array[1],card_array[0], card_array[2])
    end
    @deck
  end

end