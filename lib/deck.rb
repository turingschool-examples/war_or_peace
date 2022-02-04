# require "./lib/card"
# require 'pry'

# class Card
#   attr_reader :suit, :value, :rank
#
#   def initialize(suit, value, rank)
#     @suit   = suit
#     @value  = value
#     @rank   = rank
#   end
#
# end


class Deck

   attr_reader :cards, :index, :high_cards

  def initialize(cards)
    @cards = cards
    @high_cards = []
  end

  def rank_of_card_at(index)
    pick1 = cards[index].rank
    # @rank
  end

  def high_ranking_cards
    cards.each do |strong|
      if strong.rank >= 11
        high_cards << strong
      end
    end
    return high_cards
  end
  # binding.pry


  # def count_cards
  #   high_ranking_cards
  #   cards.count
  # end

  # def high_card_count
  #   high_ranking_cards
  #   high_cards.count
  # end
  #
  def percent_high_ranking
    hcount = 0
    card_count = cards.count + high_cards.count

    cards.each do |str|
      if str.rank >= 11
        hcount + 1
      end
    end

    percent = (hcount.to_f / card_count)
  end

  def remove_card
    cards.shift
  end

  def add_card
  end

end

# card1 = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3)
# card3 = Card.new(:heart, 'Ace', 14)
#
# cards = [card1, card2, card3]
#
# deck = Deck.new(cards)
# #
# puts deck.high_ranking_cards
# puts ""
# puts deck.cards

# puts deck.percent_high_ranking
