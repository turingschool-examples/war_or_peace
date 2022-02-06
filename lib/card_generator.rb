require './lib/card'

class CardGenerator
  attr_reader :file, :cards

  def initialize(file)
    @file = file
    @cards = []
  end

  def generate_cards
    file = File.open(@file)
    file_data = file.readlines.map(&:chomp)
  end

  def split_generated_cards
    split = generate_cards.map do |element|
      element.split(",")
    end
  end

  def create_cards
    split_generated_cards.map do |card|
      value = card[0]
      suit = card[1].to_sym
      rank = card[2].to_i
      card = Card.new(suit, value, rank)
      @cards << card
      # cards.flatten!
    end
  end
end
