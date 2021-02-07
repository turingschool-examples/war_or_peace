class CardGenerator
  attr_reader :cards

  def initialize(data)
    @cards = []
    #Need to iterate over array and pass out a string
    #array.each do |data| string do the code below...
    data.each do |card_string|
      card_info = card_string.split(",")
      #swap first two position
      card_info[0], card_info[1] = card_info[1], card_info[0]
      #make suit a symbol all lowercase
      suit = card_info[0].strip.to_sym.downcase
      #make value, its already an uppercase string
      value = card_info[1]
      #make rank an integer
      rank = card_info[2].strip.to_i
      card = Card.new(suit, value, rank)
      @cards << card
    end 
  end

  # def get_card_info(data)
  #   # require "pry"; binding.pry
  #   # 'a' is a temporary placeholder for array with data from card.txt file
  #   card_info = data.split(",")
  #   #swap first two position
  #   card_info[0], card_info[1] = card_info[1], card_info[0]
  #   #make suit a symbol all lowercase
  #   suit = card_info[0].strip.to_sym.downcase
  #   #make value, its already an uppercase string
  #   value = card_info[1]
  #   #make rank an integer
  #   rank = card_info[2].strip.to_i
  #   [suit, value, rank]
  # end

end


# File.readlines(file) do |line| puts line.chop end
