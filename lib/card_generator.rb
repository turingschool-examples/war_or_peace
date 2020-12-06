require 'csv'
require '.lib/card'


class CardGenerator
  attr_accessor :file_name, :cards
  def initialize(file_name)
    @file_name = file_name
    @cards = []
    CSV.foreach(@file_name) do |row|
      @cards << Card.new(row[0], row[1], row[2])
    end
  end
end


cards = CardGenerator.new('cards.csv').cards

p cards
p cards.length
