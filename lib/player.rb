class Player

  attr_reader :name
    def initialize(name, deck)
      @name = name
      @deck = deck
    end


    def has_lost?
        if @deck.cards.count == 0
        return true
        else
        return false
        end
    end
end
