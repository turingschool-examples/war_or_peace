class Player
    attr_reader :deck, :name
    def initialize(name, deck)
        @name = name
        @deck = deck
    end
end