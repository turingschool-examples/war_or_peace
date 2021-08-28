require 'rspec'
require './lib/card.rb'
require 'pry'

class Deck
  attr_reader :cards

  def initialize()
    @cards = []
  end

  def cards
    @cards = cards
  end

  def rank_of_card_at(index)
  end

  def high_ranking_cards
    high_ranking_cards = @cards.map do |card|
      @card >= 11
    end
  end

    # high_ranking_cards = []
    #
    # @cards.each do |card|
    #   if @rank >= 11
    #     high_ranking_cards << card
    #   end
    # end




  def percent_high_ranking
  end

  def remove_card
    @cards.shift
  end

  def add_card
    @cards.append
  end
end



# card1 = Card.new('diamond', 'Queen', 12)
# card2 = Card.new('spade', '3', 3)
# card3 = Card.new('heart', 'Ace', 14)
#
# deck1 = Deck.new(card1, card2, card3)
