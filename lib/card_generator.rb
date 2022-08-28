require './lib/card'

class Card_Generator
  attr_reader :file_name,
              :file_data,
              :cards
  def initialize(file_name)
    @file_name = file_name
    @file_data = ''
    @split_line_data = []
    @split_comma_data = []
    @cards = []
  end

  def read_file
    file = File.open("./lib/#{@file_name}")
    @file_data = file.read
    file.close
    @file_data
  end

  def split_by_line
    @split_line_data = @file_data.split("\n")
  end

  def split_line
    @split_line_data.each do |line|
      @split_comma_data << line.split(", ")
    end
    @split_comma_data
  end

  def create_cards
    @split_comma_data.each do |card_data|
      @cards << Card.new(card_data[1], card_data[0], card_data[0].to_i)
    end
  end
end
