require './lib/card'

class Card
  attr_reader :suit
  attr_accessor :rank, :value

  def initialize (suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  def card_info
    puts "#{suit}, #{value}, #{rank}"
  end
end

jack = Card.new('heart', 'Jack', 11)
