require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  attr_reader :card1, :card2, :card3
  def initialize(card1, card2, card3)
    @card1 = card1
    @card2 = card2
    @card3 = card3
  end

  def setup
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
  end

  def rank_of_card_at
    #something goes here
  end

  def high_ranking_cards
    #something here
  end

  def percent_high_ranking
    #something here
  end

  def remove_card()
    #something
  end

  def add_card
    #something
  end

end
