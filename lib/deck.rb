require 'rspec'
require 'pry'

class Deck
  attr_reader :cards
# create the deck object template with an argument
  def initialize(cards)
    @cards = cards
  end
# determine the rank of a card by looking at the index value of the cards array
  def rank_of_card_at(card_at)
    card = @cards[card_at]
    card.rank
  end
# return the card objects of all the high ranking cards and store them in the cards_above_eleven local variable
  def high_ranking_cards
    cards_above_eleven = []
    @cards.each do |card|
      if card.rank >= 11
         cards_above_eleven << card
      end
    end
    return cards_above_eleven
  end
# calculate the percent of high ranking cards in the deck
  def percent_high_ranking
    cards_above_eleven = high_ranking_cards
    high_cards_float = (cards_above_eleven.count.to_f / @cards.count)
    high_cards_float = high_cards_float * 100
    high_cards_float.round(2)
  end
# remove a card from the first position (index zero) of the cards array
  def remove_card
    @cards.delete_at(0)
    return @cards
  end
# add a card to the end of the cards array
  def add_card(card)
    @cards.push(card)
  end
end
