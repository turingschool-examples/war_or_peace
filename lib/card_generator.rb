class Card_Generator
  require 'rspec'
  require './lib/card'
  require 'pry'
  attr_reader :cards

  def initialize(file_name)
    @cards = []
    File.foreach(file_name) do |line|
    card_array = line.lines(',')

    value = card_array[0].delete(',').to_i
    suit = card_array[1].delete(',')
    rank = card_array[2].delete(',')

    @cards << Card.new(suit, value, rank)
  end


  end



end
