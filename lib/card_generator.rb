require 'csv'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards

    csv = CSV.open(@filename)
    data = []

    52.times do |card_count|
      array = csv.read[card_count] #should be an array of arrays of all cards like ['2', Heart, 2]
      card_args = [array[0], array[1], array[2]] #should be array of just 1 card's args
      suit = card_args[card_count + 1]
      value = card_args[card_count + 2]
      rank = card_args[card_count]
      card = Card.new(suit, value, rank)
      data << card

      card_count += 1
    end

    return data
  end
end
