#This class takes in card objects and creates an array.
class Deck
    attr_reader :cards

    #The cards parameter takes an array of card objects.
    def initialize(cards)
        @cards = cards
    end

    #This method returns the rank of the card at the desired index, and is used in other files.
    def rank_of_card_at(index)
        return cards[index].rank
    end
    #This method returns an array of cards in the deck that are Jacks, Queens, Kings, or Aces.
    def high_ranking_cards()
        high_rank = []
        cards.each do |card|
            if card.rank >= 11
                high_rank << card
            end
        end
        return high_rank
    end
    #This method provides us with the percentage of cards in the deck that are Jack rank or higher, rounded to the hundredth.
    def percent_high_ranking()
        high_rank = self.high_ranking_cards
        unrounded = high_rank.count / cards.count.to_f * 100
        return unrounded.round(2)
    end
    #This method removes a card from the front of the array, essentially drawing from the top of the deck.  I would rename it draw in a refactor.
    def remove_card
        cards.shift()
    end
    #This method adds a card to the bottom of the deck.
    def add_card(card)
        cards.append(card)
    end
end