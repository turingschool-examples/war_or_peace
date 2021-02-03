require './lib/card'
require 'pry'

class Deck
  #On this line, I am creating a new class called Deck
  attr_reader :cards
# The attribute reader can only read the value
  def initialize(cards, deck)
    #This is the first run (original) of cards
    @cards = cards
    #This defines the instance variable @cards and knows what the data cards is (instance variables store data, they KNOW things). This first @cards is = cards because cards is the initial value of our class
    @deck  = deck
  end

  def rank_of_card_at(index)
    # Here I am using index as the argument per the rules
    return @cards[index]
    # I am returning the value of the cards in their current positions (index)
  end

  def high_ranking_cards
    @cards.find_all do |high_card|
      #The find_all method is like .each, except it can iterate over an array
      high_card.rank >= 11
      #Calling the .rank method to rank only the cards that are >=11
  end

  def percent_high_ranking
    return high_ranking_cards().length / @cards.length.to_f
  end

  def remove_card
    @cards.shift
    #This method returns and removes the first element in @cards
  end

  def add_card(card)
    @cards.push(card)
    #I use the .push method to add elements to the end of an array
  end
end
end
