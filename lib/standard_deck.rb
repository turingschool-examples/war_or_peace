class StandardDeck
  attr_reader :cards

  def initialize
    @cards = []
    @suit_array = [:club, :diamond, :heart, :spade]
    @value_array = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    @rank_array = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  end

  def populate_deck
    suit_counter = 0
    rank_counter = 0
    52.times do |counter|
      if counter % 13 == 0 && counter != 0
        rank_counter = 0
        suit_counter += 1
      elsif counter == 0
      else
        rank_counter += 1
      end
      new_card = Card.new(@suit_array[suit_counter], @value_array[rank_counter], @rank_array[rank_counter])
      @cards << new_card
    end
  end

  def shuffle_deck
    @cards.scramble
  end
end
