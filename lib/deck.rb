require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class Deck
attr_reader :cards, :rank
    def initialize(cards)
      @cards = cards
    end

    def rank_of_card_at(location)
      if location == 0
        @cards[0].rank
      elsif location == 1
        @cards[1].rank
      else location == 2
        @cards[2].rank
      end
    end

    def high_ranking_cards
      @rank >= 11
    end

    def percent_high_ranking
    end

    def remove_card
    end

    def add_card
    end

end

deck = Deck.new(cards)
deck.rank_of_card_at(0)
require 'pry'; binding.pry
