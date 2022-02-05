require './lib/card'
require 'pry'

class CardGenerator
  attr_accessor :card_data, :cards

  def initialize(filename)
    @cards = []
    @card_data = []
    @card_count = 0

    reader = File.open(filename)
    data = reader.readlines.map(&:chomp)
    @card_data << data
    @card_data.flatten!

    reader.close


    @card_data.each do |line|
      card_arr = line.lines(',')
      suit = card_arr[0].delete(',')
      rank = card_arr[1].delete(',')
      value = card_arr[2].to_i
      @cards << Card.new(suit, rank, value)
    end


  end


end
