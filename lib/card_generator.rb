require '../lib/card'

class CardGenerator

  def initialize(filename)
    @filename = filename
    @collection = []
    @full_deck = []
  end

  def cards
    File.open(@filename).each do |line|
      @collection << line.strip.split(",")
    end

    @collection.each do |card|
      @full_deck << Card.new(card[1].strip.downcase.to_sym, card[0], card[2].to_i)
    end
    return @full_deck
  end
end
