class Player
    attr_reader :name

    def initialize(name, deck)
        @deck = deck
        @name = name
    end
end