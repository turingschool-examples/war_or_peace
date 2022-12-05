class Player

    attr :name,
         :deck

    def initialize(name, deck)
        @deck = deck
        @name = name
    end

    def has_lost?
        @deck.cards.empty?
    end




end