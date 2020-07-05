require './lib/card'

class CardGenerator

  attr_reader :results, :rank
  attr_accessor :cards_split, :suit, :value, :card_values_split, :card1, :number, :cards, :card, :counter
  def initialize
    file = File.open("./lib/cards.txt")
    @results = file.read
    @cards_split = @results.split(/\n/)
    @card_values_split = @cards_split.collect{ |x| x.split(", ")}
    @card = card
    $counter = 0
  end

  def all_cards
    @results.split(/\n/)
  end

  def suit(number)
    @card_values_split[number][1]
  end

  def rank(number)
    @card_values_split[number][2].to_i
  end

  def value(number)
    @card_values_split[number][0].downcase
  end
end
