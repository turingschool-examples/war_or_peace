require "pry"

class Deck
  attr_accessor :cards

  def initialize (cards = [])
    @cards = cards
    @suits = [:heart, :diamond, :club, :spades]
    @special_values = ['Jack', 'Queen', 'King', 'Ace']
    @special_ranks = [11, 12, 13, 14]

    if @cards == []
        @suits.each do |suit|
          for i in 2..10
              @cards << Card.new(suit, i.to_s,  i.to_i )
          end

          for i in 0..@special_ranks.length - 1
              @cards << Card.new(suit, @special_values[i], @special_ranks[i])
          end

        end
      end

  end


  def rank_of_card_at(index)
    @cards[index].rank
  end


  def high_ranking_cards
    cards.select do |card|
     card.rank > 11
    end
  end



  def percent_high_ranking
    high_rank = cards.select do |card|
     card.rank > 11
    end
     (high_rank.length.to_f/cards.length.to_f).round(3) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.append(card)
  end
end
