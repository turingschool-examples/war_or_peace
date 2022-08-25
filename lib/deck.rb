require "./lib/card.rb"
#require "pry"

class Deck 
  attr_reader :cards

  def initialize(cards)
      @cards = cards 
      @high_ranking = []
  end 

  def rank_of_card_at(index)
    @cards[index].rank
  end 

  def high_ranking_cards
    @high_ranking = []
    @cards.each do |card|
      if card.rank >= 11
        @high_ranking << card 
      end 
    end
    @high_ranking 
  end 

  def percent_high_ranking
    self.high_ranking_cards
    ((@high_ranking.length / cards.length.to_f) * 100).round(2)
  end 
    
  def remove_card 
    @cards.shift
  end 

  def add_card(card)
    @cards.push(card)
  end 
end 