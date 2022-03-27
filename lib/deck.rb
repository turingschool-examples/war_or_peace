require './lib/card'
require 'pry'

class Deck

  attr_reader :cards

  #Initialize the Deck with an array of Card objects
  def initialize(cards)
    @cards = cards
  end

  #takes an integer as its parameter, returns the rank of the card at that index
  def rank_of_card_at(index)
    rank = @cards[index].rank
    return rank
  end

  #Returns array of integers listing the ranks of card in the deck >= 11
  def high_ranking_cards
    high_card_ranks = []
    @cards.each do |card|
      rank = card.rank
      #Check if the rank of the current card is 11 or greater
      #if true add that rank to the array high_card_ranks
      if card.rank >=11
        high_card_ranks << rank
      end
    end
    return high_card_ranks
  end

  #Return a float representing the precent of cards in the deck with a rank >= 11
  def percent_high_ranking
    num_high_rank_cards = high_ranking_cards.length
    num_cards = @cards.length
    percent = (num_high_rank_cards.to_f / num_cards.to_f) * 100
    return percent.round(2)
  end

  #Remove a card from the front of the deck
  def remove_card
    @cards.shift
  end

  #Takes in a card object to add to the array of cards in the deck
  def add_card(card)
    @cards << card
  end

end
