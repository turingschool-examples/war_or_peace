class Deck
    attr_reader :cards
    def initialize(cards)
        @cards = cards
    end
    #this method will take one argument - an array of cards. 
    #an attr_reader to read the @cards attribute
def rank_of_card_at(position)
    @cards[position = 0]
    @cards[position].rank
end 
#this method will take one argument that represents the index location of a card to be used (typically 0 or 2 more on this later 😉 ) and will return the rank of that card.
def high_ranking_cards
    @cards.find_all do |card|
        card.rank >= 11
    end

end#this method will return an array of cards in the deck that have a rank of 11 or above (face cards and aces)
def percent_high_ranking
    16/52*100
    high_ranking_cards.count / @cards.count * 100
end #this method will return the percentage of cards that are high ranking

def remove_card
end #this method will remove the top card from the deck
def add_card
end