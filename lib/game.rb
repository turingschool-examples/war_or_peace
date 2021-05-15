require 'pry'

class Game
  attr_reader :diamonds, :hearts, :clubs, :spades, :card_object, :turn
  def initialize ()
    @diamonds = []
    @hearts = []
    @clubs = []
    @spades = []
    @diamond_rank = 1
    @diamond_value = '1'
    @spade_rank = 1
    @spade_value = '1'
    @club_rank = 1
    @club_value = '1'
    @heart_rank = 1
    @heart_value = '1'
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
  end

  def add_spade_card
    while @spade_rank < 10
      spade_card = [
      :spade,
      @spade_value = (@spade_value.to_i + 1).to_s,
      @spade_rank += 1,
    ]
      @spades << spade_card
    end
    while @spade_rank <14
      if @spade_rank == 10
        spade_card = [
          :diamond,
          @spade_value = 'Jack',
          @spade_rank += 1
        ]
        @spades << spade_card
      elsif @spade_rank == 11
        spade_card = [
          :spade,
          @spade_value = 'Queen',
          @spade_rank += 1
        ]
        @spades << spade_card
      elsif @spade_rank == 12
        spade_card = [
          :spade,
          @spade_value = 'King',
          @spade_rank += 1
        ]
        @spades << spade_card
      elsif @spade_rank == 13
        spade_card = [
          :spade,
          @spade_value = 'Ace',
          @spade_rank += 1
        ]
        @spades << spade_card
      end
    end
  end

  def add_club_card
    while @club_rank < 10
      club_card = [
      :club,
      @club_value = (@club_value.to_i + 1).to_s,
      @club_rank += 1,
    ]
      @clubs << club_card
    end
    while @club_rank <14
      if @club_rank == 10
        club_card = [
          :club,
          @club_value = 'Jack',
          @club_rank += 1
        ]
        @clubs << club_card
      elsif @club_rank == 11
        club_card = [
          :club,
          @club_value = 'Queen',
          @club_rank += 1
        ]
        @clubs << club_card
      elsif @club_rank == 12
        club_card = [
          :club,
          @club_value = 'King',
          @club_rank += 1
        ]
        @clubs << club_card
      elsif @club_rank == 13
        club_card = [
          :club,
          @club_value = 'Ace',
          @club_rank += 1
        ]
        @clubs << club_card
      end
    end
  end

  def add_heart_card
    while @heart_rank < 10
      heart_card = [
      :heart,
      @heart_value = (@heart_value.to_i + 1).to_s,
      @heart_rank += 1,
    ]
      @hearts << heart_card
    end
    while @heart_rank <14
      if @heart_rank == 10
        heart_card = [
          :heart,
          @heart_value = 'Jack',
          @heart_rank += 1
        ]
        @hearts << heart_card
      elsif @heart_rank == 11
        heart_card = [
          :heart,
          @heart_value = 'Queen',
          @heart_rank += 1
        ]
        @hearts << heart_card
      elsif @heart_rank == 12
        heart_card = [
          :heart,
          @heart_value = 'King',
          @heart_rank += 1
        ]
        @hearts << heart_card
      elsif @heart_rank == 13
        heart_card = [
          :heart,
          @heart_value = 'Ace',
          @heart_rank += 1
        ]
        @hearts << heart_card
      end
    end
  end

  def create_deck
    cards = []

    @diamonds.each do |card|
      card_object = Card.new(card[0], card[1], card[2])
      cards << card_object
    end

    @clubs.each do |card|
      card_object = Card.new(card[0], card[1], card[2])
      cards << card_object
    end

    @spades.each do |card|
      card_object = Card.new(card[0], card[1], card[2])
      cards << card_object
    end

    @hearts.each do |card|
      card_object = Card.new(card[0], card[1], card[2])
      cards << card_object
    end

    cards
  end
  end
