require './lib/Card.rb'

class Deck < Card
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card(position)
    rank = @cards[position].rank
  end

  def high_ranking_cards
    highcards = []
    @cards.each do |card|
      if card.rank >= 10
        highcards << card
      end
    end
    return highcards
  end

  def percent_high_ranking
    count = 0
    @cards.each do |card|
      if card.rank >= 11
        count += 1
      end
    end
    return percent = (count.to_f/@cards.count().to_f)*100
  end
end
  # def high_ranking_cards
  #   return @cards if @cards.rank >=10
  # end
