class WarOrPeace
  attr_accessor :deck, :hand1, :hand2

    SUIT_CONSTANT = [:heart, :diamond, :club, :spade]
    RANK_CONSTANT = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    VALUE_CONSTANT = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

  def initialize
    @deck = []
    @hand1 = []
    @hand2 = []
  end

  def create_cards
    SUIT_CONSTANT.each do |suit|
      for number in 0..12
        a_card = Card.new(suit, VALUE_CONSTANT[number], RANK_CONSTANT[number])
        @deck << a_card
      end
    end
  end

  def make_two_hands
    @deck.shuffle!(random: Random.new(1))
    @deck.shift(26).each{|card| @hand1 << card}
    @deck.shift(26).each{|card| @hand2 << card}
  end
end
