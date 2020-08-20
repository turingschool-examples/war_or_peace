class Player
  attr_reader :name, :deck
    def initialize(name, deck = [])
      @name = name
      @deck = deck
    end

    def has_lost?
      empty_deck?
    end

    def empty_deck?
      @deck.cards == []
    end
end
