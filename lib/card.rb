require 'rspec'

class Card
  attr_reader :suit,
              :rank,
              :value

  def initialize (suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  def card_info
    puts "#{suit}, #{value}, #{rank}"
  end
end

card = Card.new('heart', 'Jack', 11)
card1 = Card.new('diamond', 'Queen', 12)
card2 = Card.new('spade', '3', 3)
card3 = Card.new('heart', 'Ace', 14)
