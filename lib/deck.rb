require './lib/card'

class Deck
  #On this line, I am creating a new class called Deck
  attr_reader :cards
# The attribute reader
  def initialize(cards)
    #This is the first run (original) of cards
    @cards = cards
    #This defines the instance variable @cards and knows what the data cards is (instance variables store data, they KNOW things). This first @cards is = cards because cards is the initial value of our class
  end

  def rank_of_card_at(index)
    # Here I am using index as the argument per the rules
    return @cards[index]
    # I am returning the value of the cards in their current positions (index)
  end

  def high_ranking_cards
    high_ranking = array.new
    cards.each do |highcard|
      if highcard > 11
        high_ranking.push(card)
      elsif highcard < 11
        puts "Your card is not higher than 11."
      end
      puts high_ranking
  end

  def percent_high_ranking
  end

  def remove_card
    @cards.shift
  end

  def add_card
  end
end
