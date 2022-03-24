class Deck
  require 'rspec'
  require './lib/card'
  require 'pry'
  attr_reader :cards

def initialize(cards)
  @cards = cards
end

def rank_of_card_at(index)
  @cards[index].rank
end

def high_ranking_cards
  @cards.find_all do |card|
    card.rank >= 11
end

def percent_high_ranking
  percent = 0.0
  percent = @cards.high_ranking_cards / @cards.length
end

def remove_card
  @cards.shift
end

def add_card(card)
  @cards.push(card)
end

end
end
