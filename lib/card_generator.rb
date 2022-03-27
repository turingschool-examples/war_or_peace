class Card_Generator
  require 'rspec'
  require './lib/card'
  require 'pry'
  attr_reader :cards

  def initialize(file_name)
    @cards = []
    File.foreach(file_name) do |line|
      line.chomp!
      card_array = line.lines(',')
      value = card_array[0].delete(',').delete(' ')
      suit = card_array[1].delete(',').delete(' ')
      rank = card_array[2].delete(',').delete(' ').to_i
      @cards << Card.new(suit, value, rank)
    end
  end
end
