require 'rspec'
require 'pry'

class Deck
  attr_reader :cards, :cards_above_eleven
# create the deck object template with an argument
  def initialize(cards)
    @cards = cards
    @cards_above_eleven = []

  end
# determine the rank of a card by looking at the index value of the cards array
  def rank_of_card_at(card_at)
    card = @cards[card_at]
    card.rank
  end
# return the card objects of all the high ranking cards and store them in the cards_above_eleven instance variable
# Question: this is somehow duplicating the cards, why isn't it stopping at one iteration?
#  - It seems connected to the incorrect percentage totals I get when 'prying' the interaction pattern.
  def high_ranking_cards
    @cards.each do |card|
      if card.rank >= 11
         @cards_above_eleven << card
      end
    end
    @cards_above_eleven
  end
# calculate the percent of high ranking cards in the deck
  def percent_high_ranking
    high_ranking_cards
    high_cards_float = (@cards_above_eleven.count.to_f / @cards.count)
    high_cards_float = high_cards_float * 100
    high_cards_float.round(2)
  end
# remove a card from the first position (index zero) of the cards array
  def remove_card
    @cards.delete_at(0)
    @cards
  end
# add a card to the end of the cards array
  def add_card(card)
    @cards.push(card)
  end
end
