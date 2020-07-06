require './lib/card'

class CardGenerator

  attr_reader :results
  attr_accessor :cards_split, :card_values_split, :number, :counter

  def initialize(filename)

    file = File.open(filename)
    @results = file.read
    @cards_split = @results.split(/\n/)
    @card_values_split = @cards_split.collect{ |x| x.split(", ")}
    $counter = 0
  end

  def cards_as_a_deck
    @results.split(/\n/)
  end

  def suit_of_one_card(number)
    @card_values_split[number][1]
  end

  def rank_of_one_card(number)
    @card_values_split[number][2].to_i
  end

  def value_of_one_card(number)
    @card_values_split[number][0].downcase
  end
end
