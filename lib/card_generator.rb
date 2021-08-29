require 'csv'
require './lib/card.rb'

class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def cards
    deck = []

    data = File.read(@filename).split(",").map(&:strip)

    1.step((13*3*4), 3) do |card_count|
      rank = data[card_count + 1].to_i
      value = data[card_count - 1]
      suit = data[card_count].to_sym

      card = Card.new(suit, value, rank)
      deck << card
    end

    return deck
  end
end
