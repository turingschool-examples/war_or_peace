class CardGenerator
  attr_reader :box_cards

  def initialize(data)
    @box_cards = []
    card_info = data.split(",")
    #swap first two position
    card_info[0], card_info[1] = card_info[1], card_info[0]
    #make suit a symbol all lowercase
    suit = card_info[0].strip.to_sym.downcase
    #make value, its already an uppercase string
    value = card_info[1]
    #make rank an integer
    rank = card_info[2].strip.to_i
    @box_cards.push(suit, value, rank)
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
