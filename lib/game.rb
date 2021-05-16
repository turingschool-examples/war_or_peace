require 'pry'

class Game
  attr_reader :diamonds, :hearts, :clubs, :spades, :card_object
  def initialize ()
    @diamonds = []
    @hearts = []
    @clubs = []
    @spades = []
    @card_rank = 1
    @card_values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  end

  def add_diamond_card
    #binding.pry
    @diamonds = @card_values.map do |value|
      card = [
        :diamond,
        value,
        @card_rank += 1
      ]
    end
    @card_rank = 1
  end

  def add_spade_card
    @spades = @card_values.map do |value|
      card = [
        :spade,
        value,
        @card_rank += 1
      ]
    end
    @card_rank = 1
  end

  def add_club_card
    @clubs = @card_values.map do |value|
      card = [
        :club,
        value,
        @card_rank += 1
      ]
    end
    @card_rank = 1
  end

  def add_heart_card
    @hearts = @card_values.map do |value|
      card = [
        :heart,
        value,
        @card_rank += 1
      ]
    end
    @card_rank = 1

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
