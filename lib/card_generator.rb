class CardGenerator
  attr_reader :card_array,
              :filename

  def initialize(filename)
    @card_array = []
    @filename = filename
  end

  def cards
    File.readlines(@filename, chomp: true).each do |card|
      @card_array << card.split(',')
    end

    @card_array.map do |card|
      card = Card.new(card[0].to_sym, card[1], card[2].to_i)
    end
  end
end
