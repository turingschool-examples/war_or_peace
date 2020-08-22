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
      if counter.to_f % 4 == 0
        suit_counter = 0
      else
        suit_counter += 1
      end
      if counter.to_f % 13 == 0
        rank_counter = 0
      else
        rank_counter += 1
      end
      new_card = Card.new(@suit_array[suit_counter], @value_array[rank_counter], @rank_array[rank_counter])
      @cards << new_card
    end
  end
  # def create_suit_array
  #   suit_counter = 0
  #   suits = [:club, :diamond, :heart, :spade]
  #   52.times do |counter|
  #     if counter.to_f % 13 == 0 && counter != 0
  #       suit_counter += 1
  #     end
  #     suit_array << suits[suit_counter]
  #   end
  # end
  #
  # def create_rank_values_hash
  #
  #
  # def populate_deck
  #   suit_counter = 0
  #   suits = [:club, :diamond, :heart, :spade]
  #   rank_counter = 2
  #   rank_values = {
  #     2 => '2',
  #     3 => '3',
  #     4 => '4',
  #     5 => '5',
  #     6 => '6',
  #     7 => '7',
  #     8 => '8',
  #     9 => '9',
  #     10 => '10',
  #     11 => 'Jack',
  #     12 => 'Queen',
  #     13 => 'King',
  #     14 => 'Ace'
  #   }
  #
  #   52.times do |counter|
  #     if counter.to_f % 13 == 0 && counter != 0
  #       suit_counter += 1
  #     end
  #     suit = suits[suit_counter]
  #   end
  # end

end
