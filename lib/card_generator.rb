require './lib/card'

class CardGenerator
  def generate_cards(file_name)
    cards = []

    File.foreach(file_name) do |line|
      card_data = line.chomp.split(", ")

      cards << Card.new(card_data[1].downcase.to_sym, card_data[0], card_data[2].to_i)
    end

    cards
  end
end