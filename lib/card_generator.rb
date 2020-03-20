# card_list = []
# File.open("./lib/cards.txt").each do |line|
#   card_list << line
# end
# puts "Card List: #{card_list}"

require './lib/card'

class CardGenerator
  attr_reader :card_list

  def initialize(filename)
    @filename = filename
  end

  #turn list into array
  def file_to_array
    @card_list = []
    File.open("./lib/cards.txt").each do |line|
      card_list << line
    end
    @card_list.each do |card|
      card.slice!("\n")
    end
    puts "#{@card_list}"
    @card_list
  end

  def divide_into_3_components
    #this comment is made in card geneartor branch

  end


end
