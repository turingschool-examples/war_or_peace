# deck of cards
require './lib/card.rb'

class Card
    # The next line will have the same function as:
    # def <method> 
    #     @<attribute>
    # end
attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

class Deck
    attr_reader :cards # :suit, :value, :rank
    attr_accessor :suit, :value, :rank

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(number)
        @cards.each_with_index do |spot|
        end


    end

    def high_ranking_cards
        high_rank = []
        @cards.each do |high|
            if cards.rank > 10
                high_rank << high
            end
            high_rank
        end
    end

    def percent_high_ranking

    end

    def remove_card
        @cards.pop
    end

    def add_card(deck)
        
    end

end

