class Player
    attr_reader :name,
                :deck

    def initialize(name, deck)
        @deck = deck
        @name = name
    end
end