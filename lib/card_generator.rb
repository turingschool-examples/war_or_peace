require './lib/card'
require 'pry'

class CardGenerator
  attr_accessor :cards

  def initialize(filename)
    @cards = []

    reader = File.open(filename)
    reader.readlines.each do |line|
      line.chomp
      card_arr = line.lines(',')

      suit = card_arr[0].delete(',')
      rank = card_arr[1].delete(',')
      value = card_arr[2].to_i

      @cards << Card.new(suit, rank, value)
    end

    reader.close

  end

end
