class Player
        attr_reader :name,
                    :deck

    def initialize(name, deck)
        @name = name
        @deck = deck
    end

    def has_lost?
        if @deck == []
            true
        else
            false
        end
    end

end
