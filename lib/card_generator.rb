require './lib/card'

class CardGenerator
  attr_reader :cards, :filename
  def initialize(filename)
    @filename = filename
    @cards = cards
    @cards = sort_file_into_deck()
  end
  
  # Read .txt file provided by user and create an array of cards
  
  def sort_file_into_deck
    cards_import = File.open("lib/#{filename}").read.split("\n")
    card_collector = []
    cards_import.each do |card_text|
      formatted_card = card_text.split(", ")
      card = Card.new(formatted_card[1].to_sym, formatted_card[0], formatted_card[2].to_i)
      card_collector << card
    end
    @cards = card_collector
  end
end