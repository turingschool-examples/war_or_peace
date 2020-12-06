require 'csv'
require_relative './card'


class CardGenerator
  attr_reader :file_name
  attr_accessor :cards
  def initialize(file_name)
    @file_name = file_name
    @cards = []
    CSV.foreach(@file_name) do |row|
      @cards << Card.new(row[0], row[1], row[2])
    end
  end
end


# file_name = 'cards.csv'
# cards = CardGenerator.new(file_name).cards
#
# p cards
