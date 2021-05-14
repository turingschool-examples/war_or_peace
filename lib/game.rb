require 'pry'

class Game
  attr_reader :diamonds, :hearts, :clubs, :spades
  def initialize ()
    @diamonds = []
    @hearts = []
    @clubs = []
    @spades = []
    @diamond_rank = 1
    @diamond_value = '1'
  end

  def add_diamond_card
    #binding.pry
    while @diamond_rank < 10
      diamond_card = [
      :diamond,
      @diamond_value = (@diamond_value.to_i + 1).to_s,
      @diamond_rank += 1,
    ]
      @diamonds << diamond_card
    end
    while @diamond_rank <14
      if @diamond_rank == 10
        diamond_card = [
          :diamond,
          @diamond_value = 'Jack',
          @diamond_rank += 1
        ]
        @diamonds << diamond_card
      elsif @diamond_rank == 11
        diamond_card = [
          :diamond,
          @diamond_value = 'Queen',
          @diamond_rank += 1
        ]
        @diamonds << diamond_card
      elsif @diamond_rank == 12
        diamond_card = [
          :diamond,
          @diamond_value = 'King',
          @diamond_rank += 1
        ]
        @diamonds << diamond_card
      elsif @diamond_rank == 13
        diamond_card = [
          :diamond,
          @diamond_value = 'Ace',
          @diamond_rank += 1
        ]
        @diamonds << diamond_card
      end
    end
    binding.pry
  end

  def add_spade_card
  end
  def add_club_card
  end
  def add_heart_card
  end

  def create_deck(deck)
    # smush arrays together and randomize into deck
  end

    def create_diamond_cards
      cards = []
      @diamonds.each do |each_diamond|
        card = Card.new(each_diamond[0], each_diamond[1], each_diamond[2])
        cards << card
      end
      cards
    end
  end
