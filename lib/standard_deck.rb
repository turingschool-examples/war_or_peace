class StandardDeck
  attr_reader :cards, :suit_array

  def initialize
    @cards = []
    @suit_array = []
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

  def create_suit_array
    suit_counter = 0
    suits = [:club, :diamond, :heart, :spade]
    52.times do |counter|
      if counter.to_f % 13 == 0 && counter != 0
        suit_counter += 1
      end
      suit_array << suits[suit_counter]
    end
  end

  def create_rank_values_hash


  def populate_deck
    suit_counter = 0
    suits = [:club, :diamond, :heart, :spade]
    rank_counter = 2
    rank_values = {
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

    52.times do |counter|
      if counter.to_f % 13 == 0 && counter != 0
        suit_counter += 1
      end
      suit = suits[suit_counter]
    end
  end

end
