require 'card.rb'
card1 = Card.new(:diamond, "Queen", 12)
card2 = Card.new(:spade, "3", 3)
card3 = Card.new(:heart, "Ace", 14)
card4 = Card.new(:club, "5", 5)

cards = [card1, card2, card3]

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(array_loc)
    cards.[array_loc].rank
  end

  def high_ranking_cards
    big_ones = []
    cards.each do |card|
      if card.rank >= 11
        big_ones.append(card)
      end
    puts big_ones
  end

  def percent_high_ranking
    big_ones = []
    cards.each do |card|
      if card.rank >= 11
        big_ones.append(card)
      end
    end
    billionaire_index = (big_ones.count / cards.count) * 100
    puts billionaire_index.round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card4)
    cards.push(card4)
  end
end
