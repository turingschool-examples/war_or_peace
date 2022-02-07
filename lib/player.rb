#This class takes in a Deck object and a provided name string, and creates a Player object that can detect if it's lost.
class Player
    attr_reader :name, :deck

    def initialize(name, deck)
        @name = name
        @deck = deck
    end
    # This method checks if the player's deck object is out of cards, and if it is, returns that they have lost.
    def has_lost?
        if deck.cards.count == 0
            return true
        else
            return false
        end
    end
end