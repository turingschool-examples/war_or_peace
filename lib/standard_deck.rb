class StandardDeck
  attr_reader :cards

  def initialize
    @cards = []
    @suit_array = [:club, :diamond, :heart, :spade]
    @rank_values = {
      2 => '2',
      3 => '3',
      4 => '4',
      5 => '5',
      6 => '6',
      7 => '7',
      8 => '8',
      9 => '9',
      10 => '10',
      11 => 'Jack',
      12 => 'Queen',
      13 => 'King',
      14 => 'Ace'
    }
  end

  def populate_deck
    @suit_array.each do |suit|
      @rank_values.each do |rank, value|
        new_card = Card.new(suit, value, rank)
        @cards << new_card
      end
    end
  end

  def shuffle_deck
    @cards.scramble
  end
end
