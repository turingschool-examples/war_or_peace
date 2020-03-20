# Create a Deck class and an accompanying test file with the following instance methods:
#

# rank_of_card_at: this method will take one argument
#that represents the index location of a card to be used
#(typically 0 or 2 more on this later 😉 ) and will return
#the rank of that card.

# high_ranking_cards: this method will return an array of
#cards in the deck that have a rank of 11 or above
#(face cards and aces)

# percent_high_ranking: this method will return the
# percentage of cards that are high ranking

# remove_card: this method will remove the top card from the deck
#
# add_card: this method will add one card to the bottom
#(end) of the deck

# Use the interaction pattern below to help you build
#your DeckTest and Deck class.
#
# Remember, #<Card:0x00randomletters&nums...> means “A Card Object” or “An Ins

####
#do i need to require card file in this file?


class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end


  def rank_of_card_at(index)
  #require "pry"; binding.pry
    @cards[index].rank

  end

  def high_ranking_cards
    high_ranking = []
    @cards.each do |card|
      if  card.rank >= 11
        high_ranking << card
      elsif
        card.rank < 11
        high_ranking != [card]

      end

    end
    high_ranking

  end
  #
  def percent_high_ranking
    count = 0
    @cards.each do |card|
      if card.rank >= 11
        count += 1
      else
        count += 0
      end
    end
    ((count.fdiv((@cards.count).to_f))*100).round(0)

  end


  def remove_card
    @cards.shift
    @cards
  #  require 'pry'; binding.pry
  end

  def add_card(card)
    @cards << card
    # require 'pry'; binding.pry
  end

end
