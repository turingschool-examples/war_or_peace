class Player
    attr_reader :name, :deck, :player
    def initialize(name, deck)
        @name = name
        @deck = deck
    end
end