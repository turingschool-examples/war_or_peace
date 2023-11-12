require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/start"

    def deck
        deck = []
        deck << Card.new
        deck.map do |card|
            card * 2
        end
    end

end