require 'csv'
require './lib/card'

class CardGenerator 
  def initialize(filename)
    @filename = filename 
    @cards = []
  end

  def cards
    table = CSV.read(@filename)
    table.each do |row|
      suit = row[1].strip.downcase.to_sym
      value = row[0].strip
      rank = row[2].strip.to_i
      @cards << Card.new(suit, value, rank)
    end
    @cards
  end
end
