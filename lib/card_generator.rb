require './lib/card'

class CardGenerator
  attr_accessor :cards
  def initialize(filename)
    @cards = []
    card_count = 0
    File.foreach(filename) do |line|
      card_count += 1
      Card.new(line(0).to_sym, line(1).to_s, line(2))
  end
end
