require 'pry'
class Deck
  attr_reader :cards,
              :high_ranking_cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
     high_rank = []
       @cards.each do |card|
         if card.rank >= 11
           high_rank << card
        end
    end
    high_rank
   end
  end


#   end
#  end
# end
