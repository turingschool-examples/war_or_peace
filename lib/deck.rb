require './lib/card'

class Deck

  attr_reader :cards

  #constructor
  def initialize (cards)
    @cards = cards
  end

  #returns the requested index for the array 'cards'
  def rank_of_card_at (num)
    cards.fetch(num, "Index #{num} is out of bounds.")
  end

  #returns an array of cards in the deck that have a rank of 11 or above
  def high_ranking_cards

    cards.select do |card|
    card.rank >= 11
    end

  end

  #calculates the percentage of cards with rank 11 or higher in cards array
  def percent_high_ranking
    percent = high_ranking_cards.length / cards.length.to_f
  end

  #adds a new card to the end of the deck
  def add_card(new_card)
    cards.push(new_card)
  end

  #removes the top card from the deck and returns the remainders
  def remove_card
    cards.shift
    return cards
  end

end
