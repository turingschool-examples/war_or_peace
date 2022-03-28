class Deck

attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_element) # passes the argument from rank_of_card_at(0) and (2)
    cards_rank = @cards[index_element].rank # stores array element 0's rank from class Card into new variable
    return cards_rank # returns the variable within cards rank which is the rank from the element argument
  end

  def high_ranking_cards
    new_array = []
    @cards.each do |card| # cycles through the cards array a total of 3 times
      if card.rank >= 10
        new_array << card # each element it cycles that is found at 11 or above will be added to our new array
      end
    end
    return new_array # returns our new array variable
  end

   def percent_high_ranking_cards # two thirds of cards are currently high ranking..
     percent_amount = high_ranking_cards.length.to_f / @cards.length.to_f # meaning 0.66666666667. To get a percent we must find a way to do 66.67 percent as the return
     percent_amount = percent_amount * 100
     return percent_amount.round(2)  # the result of 2 divided by 3 which is 0 so the 0.6666667 is not read after the 0. We need to convert to floats then round 2 decimal
   end

  def remove_card
    @cards.shift # removes the first element in the cards object within decks Class.
  end

  def add_card(new_card) # method .add_card is used with an argument such as deck.add_card(card4)
    @cards.push(new_card) # going to push 'card4' to the end of the cards array
  end
end
