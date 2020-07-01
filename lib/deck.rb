require './lib/card'
require "pry"

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end


  def add_card(card)
    @deck << card
  end

  def remove_card
    @deck.shift
  end

  # def rank_of_card_at
  #
  # end
  #
  # def percent_high_ranking
  #
  # end

  def high_ranking_cards

    high_ranking_cards = []

    cards.each do|card|
      if card.rank >= 11
        high_ranking_cards << card
      end
    end
    #below line is return value
    high_ranking_cards
  end

end

card_one = Card.new(:heart, "King", 13)
card_two = Card.new(:spade, "two", 2)
card_three = Card.new(:diamond, "Queen", 12)
cards = []
cards << card_one
cards << card_two
cards << card_three
deck = Deck.new(cards)
#
binding.pry
