class CardGenerator

    def initialize(filename)
        @filename = filename
    end

    def cards
       deck = File.read(@filename).split("\n").map do |card_info|
            
            rank = card_info.split(",").first
            suit = card_info.split(",")[1]
            value = card_info.split(",").last
            Card.new(suit, value, rank)
        end
        Deck.new(deck)
    end
end

