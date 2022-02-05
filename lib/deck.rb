require './lib/card'

class Deck
  attr_reader :cards, :rank_of_card_at, :high_ranking_cards, :percent_high_ranking, :remove_card, :add_card

  def initialize(cards)
    @cards = cards
  end

  # def rank_of_card_at(rank)
  #   @cards[rank].rank
  # end
  def rank_of_card_at(rank)
    if cards[2] == nil
      1
    else
      @rank_of_card_at = cards.fetch(rank)
      @rank_of_card_at.rank
    end

  end

  def high_ranking_cards
    face_cards = []
    @cards.each do |card|
      if card.rank >= 11
        face_cards << card# @cards.delete(card)
      end
    end
    face_cards
  end

  def percent_high_ranking
    high_ranking_cards
    # total_cards = @cards
    total = high_ranking_cards.count / @cards.count.to_f * 100
    total.round(2)

  end

  def remove_card
    @cards.shift
  end

   def add_card(new_card)
     @cards << new_card
   end

end
# require 'pry'; binding.pry

#secondary solutions?
# def percent_high_ranking
#   high_ranking_cards
#   high = @high_ranking_cards
#   total = cards.count
# end

#def percent_high_ranking
#high_ranking_cards.size
# return @cards.length.to_f
# @percent_high_ranking = high_ranking_cards.size / 2
#   number = high_ranking_cards.size / cards.length
#     return
