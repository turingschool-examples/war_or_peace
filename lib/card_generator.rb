
class CardGenerator
  attr_reader :filename


  def initialize(filename = "cards.txt")
    @filename = filename
    @car_arr = []
    fill_array

  end

def cards
  @car_arr
end

def fill_array
  File.readlines("./lib/" + @filename).each do |line|
    card = line.split
    suit = card[0]
    value = card[1]
    rank =card[2].to_i
    card_ea = Card.new(suit, value, rank)
    @car_arr << card_ea
  end
end
end
