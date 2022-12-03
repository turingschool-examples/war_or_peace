class CardGenerator 
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = load_cards
  end

  def load_cards 
    cards_array = []
    card_details = File.readlines(@filename)
  
    card_details.each_with_index do |line, column| 
      column = line.split(",")
      cards_array << Card.new(column[1].downcase.to_sym, column[0], column[2].to_i)
    end
    cards_array
  end
end