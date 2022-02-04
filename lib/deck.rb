# require "./lib/card"
# require 'pry'

class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit   = suit
    @value  = value
    @rank   = rank
  end

end


class Deck

   attr_reader :cards, :index, :high_cards, :new_card

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    pick1 = cards[index].rank
  end

  def high_ranking_cards
    @high_cards = []
    cards.each do |strong|
      if strong.rank >= 11
        high_cards << strong
      end
    end
    return high_cards
    # high_cards.clear
  end
  # binding.pry


  # def count_cards
  #   return cards.count
  # end
  #
  # def high_card_count
  #   return high_cards.count
  # end
  #
  def percent_high_ranking
    hcount = 0
    card_count = cards.count

    cards.each do |str|
      if str.rank >= 11
        hcount += 1
      end
      # binding.pry
    end

    percent = ((hcount.to_f / card_count) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(new_card)
    cards.push(new_card)
  end

end

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)

cards = [card1, card2, card3]

deck = Deck.new(cards)
# #
puts deck.high_ranking_cards
puts ""
puts deck.cards
puts ""
# puts deck.count_cards
# puts ""
# puts deck.high_card_count
puts deck.percent_high_ranking

deck.remove_card
puts ""
puts deck.cards
puts ""
puts deck.high_ranking_cards
puts ""
puts deck.percent_high_ranking

card4 = Card.new(:club, "5", 5)
puts ""
deck.add_card(card4)
puts ""
puts deck.cards
puts ""
puts deck.percent_high_ranking
