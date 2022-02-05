require 'pry'
require './lib/card'

class CardGenerator

  attr_reader :cards,
              :filename

  def initialize(filename)
    @filename = filename
    @cards = []

    raw_deck_data = File.readlines(filename).map(&:chomp)
    indexed_deck_data = []

    raw_deck_data.each do |index|
      indexed_deck_data << index.split(',')
    end

    indexed_deck_data.each do |card|
      suit = card[0].to_s
      suit = suit.to_sym
      value = card[1].to_s
      value = value.delete(" ")
      rank = card[2].to_i
      new_card = Card.new(suit, value, rank)
      @cards << new_card
    end
  end

end
