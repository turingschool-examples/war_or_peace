require 'pry'
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(card_index) #method will take one argument that reps the index position of card being passed 
    @cards[card_index].rank #This was confusing but I put in a pry and saw what I had access to
  end           #I found @cards[0].rank returned what I wanted but the () from the argument thru me off 
                #I just needed to replace the 0 with [card_index] to match the argument variable that's passed thru
  def high_ranking_cards
    @cards.find_all do |card| #had to find the right enumerable for this. find_all returns an array of all elements
      card.rank >= 11       #that match the written condition 
    end
  end

  def percent_high_ranking #this method will return the percentage of cards that are high ranking
    (high_ranking_cards.count.to_f / @cards.count.to_f).round(4) * 100 #this was a doozy. Pry til you die! Also helped to waterfall through previous methods and build on them. Learned a lot in this method. 
    #learned I could use .count on a method, and that I have to convert a number to_f and then round it to the decimal point I want. In this case (4)
  end

  def remove_card #this method will remove the top card from the deck
    @cards.shift #this method removes the first element of an array. 
  end

  def add_card(card) #This method will add one card to the bottom (end) of the deck
    @cards.push(card) #This method will "push" a card object to the end of an array
  end
end   