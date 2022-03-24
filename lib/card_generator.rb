require './lib/card'

class CardGenerator
  def initialize(file_name)
    @file_name = file_name
  end

  def cards
    raw_file_data = []
    File.foreach(@file_name) { |line| raw_file_data << line.sub("\n", '').split(',') }

    raw_file_data.map! do |card|
      [card[1].to_sym, card[0], card[2].to_i]
    end

    deck = []

    raw_file_data.each do |card|
      deck << Card.new(card[0], card[1], card[2])
    end

    deck
  end
end
