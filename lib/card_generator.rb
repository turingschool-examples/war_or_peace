class CardGenerator

  attr_reader :filename
  def initialize(filename)
    @filename = "cards.txt"
  end

  def read_file
    all_attributes = []
    File.open(@filename).each do |line|
      card_attribute = line.split(', ')
      all_attributes << card_attribute
    end
    all_attributes
  end

  def create_cards
    created_cards = []
    card_attributes = 0
    while card_attributes < 52 do
      all_attributes = read_file
      # require "pry"; binding.pry
      single_card = all_attributes[card_attributes]
      created_cards << Card.new(single_card[0], single_card[1].to_s, single_card[2].chomp.to_i)
      card_attributes += 1
    end
    created_cards
  end
end
