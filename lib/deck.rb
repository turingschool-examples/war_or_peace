require 'pry'
require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards=[])
    @cards = cards
  end

  def full_deck
    all_cards = []
    values = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
    ranks = 1..13
    suits = [:hearts, :diamonds, :spades, :clubs]
    
    values.zip(ranks).each do |value, rank|
      suits.each do |suit|
        all_card_arguments = Card.new(suit, value, rank)
        all_cards << all_card_arguments
      end
    end
    all_cards
  end

  def rank_of_card_at(card)
    if @cards[card]
      @cards[card].rank
    else
     0
    end
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    high_cards = []

    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end

    percent = high_cards.count / @cards.count.to_f
    percent.round(4) * 100
  end

  def remove_card
    @cards.shift
    cards
  end

  def add_card(card)
    @cards << card
  end

end
# binding.pry
