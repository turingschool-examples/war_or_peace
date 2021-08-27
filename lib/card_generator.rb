class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    deck = CSV.parse(File.read(@filename), headers: true)

    card_num = 0
    card_deck = []

    52.times do
      card = Card.new(deck[card_num]["suit"].to_sym, deck[card_num]["value"], deck[card_num]["rank"].to_i)
      card_deck << card
      card_num += 1
    end

    card_deck
  end
end
