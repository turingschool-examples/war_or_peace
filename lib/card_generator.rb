class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = generate_cards
  end

  def generate_cards
    generated_cards = []

    card_strings = File.readlines(filename, chomp:true)
    card_strings.each do |card_string|
      card_data = card_string.split(", ")

      suit = card_data[1].downcase.to_sym
      value = card_data[0]
      rank = card_data[2].to_i

      generated_cards << Card.new(suit, value, rank)
    end

    generated_cards
  end

end
