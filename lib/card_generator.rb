require 'csv'

class CardGenerator
    attr_reader :cards

    def initialize(file)
        @cards = []
        create_deck(file)
    end

    def create_deck(file)
        file = CSV.read(file)

        file.each do |card|
            @cards << Card.new(card[1].strip.downcase.to_sym, card[0], card[2].to_i)
        end

        @cards
    end
end