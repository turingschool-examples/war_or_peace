class CardGenerator
  attr_reader :card_array, # allows for reading the card array and filename
              :filename

  def initialize(filename) # creates a cardgenerator with a file name and an empty card array
    @card_array = []
    @filename = filename
  end

  def cards # generates an initial array of cards, where each item in the array is an array with the card data
    File.readlines(@filename, chomp: true).each do |card|
      @card_array << card.split(',')
    end

    @card_array.map do |card| # converts the card array to individual interactable cards and outputs the resulting array
      card = Card.new(card[0].to_sym, card[1], card[2].to_i)
    end
  end
end
