require './card.rb'
require 'pry'

class Deck
  attr_reader :cards, :suite, :value, :rank

  def initialize(cards)
    @cards = []
  end

  def cards_in_deck
    @cards << Card.new
  end

  # def rank_of_card_at(0)
  #   # @cards.map { |card| }
  # end

  # def high_ranking_cards([])
  # end
  #
  # def percent_of_high_ranking_cards
  #
  # end
  #
  # def remove_card
  #
  # end
  #
  # def add_card
  #
  # end

end
