require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


class CardGenerator

  def initialize(filename)
    @filename = filename
    @suits = []
    @values = []
    @rank = []
  end

  def populate_cards
    card_data = []
    File.foreach(@filename)  do |line|
      card_data << line.split(",")
      # binding.pry
    end
    card_data.each do |card_type_array|
      @suits << card_type_array[1].downcase.chomp!(' ')
      @values << card_type_array[0]
    end
  end

  def create_deck
    @all_cards = []
    @suits.uniq.each do |current_suit|
      suit = current_suit.intern
      binding.pry
      @values.uniq.each do |current_value|
        value = current_value
        if value == 'Jack'
          rank = 11
        elsif value == 'Queen'
          rank = 12
        elsif value == 'King'
          rank = 13
        elsif value == 'Ace'
          rank = 14
        else
          rank = value.to_i
        end
      end
      suit_value = Card.new(suit, value, rank)
      @all_cards << suit_value
    end
    binding.pry
  end

    # File.foreach(filename) { |line| array = line.slice.to_a}
end

cards = CardGenerator.new('cards.txt')
cards.populate_cards
cards.create_deck
