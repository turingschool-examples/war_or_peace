#require './lib/cards.txt'
class CardGenerator 
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards =[]
  end

  def load_cards 
  
    card_details = File.readlines(@filename)
      

    card_details.each_with_index do |line, column| 
      column = line.split(",")
      
      @cards << Card.new(column[1].downcase.to_sym, column[0], column[2].to_i)
    end
    @cards
  end
end