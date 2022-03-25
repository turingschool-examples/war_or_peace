class CardGenerator
  require 'rspec'
  require './lib/deck'
  require './lib/card'
  require './lib/player'
  require './lib/turn'
  require './lib/game'
  require 'CSV'

  attr_reader :filename, :new_deck, :array

  def initialize(filename)
    @filename = filename
    # new_deck = Deck.new([])
    # array = CSV.read("./lib/#{@filename}")
    #   # require 'pry'; binding.pry
    # array.each do |card_counter|
    #   # require 'pry'; binding.pry
    #   new_deck.cards.push (Card.new(card_counter[0], card_counter[1], card_counter[2]))
    #   # return new_deck
    #   # require 'pry'; binding.pry
    end
    def generate_cards
      new_deck = Deck.new([])
      array = CSV.read("./lib/#{@filename}")
        # require 'pry'; binding.pry
      array.each do |card_counter|
        # require 'pry'; binding.pry
        new_deck.cards.push (Card.new(card_counter[0], card_counter[1], card_counter[2]))
        # return new_deck
      end
      return new_deck

    end

    # require 'pry'; binding.pry
    # return new_deck
    # require 'pry'; binding.pry
    # new_deck = Deck.new

  end
