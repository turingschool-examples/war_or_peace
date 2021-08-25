require './lib/card.rb'


class Deck
  attr_reader(:cards)
  def initialize(cards)
    @cards = cards
  end

  def add_cards(card)
    @cards.push(card)
  end
  


  #def rank_of_card_at(index_location)
    #@rank = rank
    #return rank
  #end

  #def high_ranking_cards
    #high_cards = []
    #cards.each do |card|
    #  if cards.rank >= 11
        #high_cards << card
    #  end
    #  return high_cards
  #  end
#  end
end
    #high_cards = []

    #cards.each do |card|
      #if card.rank >= 11
        #high_cards.push(card)
        #return high_cards
      #end
    #end
  #end

  #def percent_high_ranking
    #def percents
    #self.to_f / n.to_f * 100.0
    #end
  #end
#end



require 'pry'; binding.pry
