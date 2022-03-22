# a single deck

class Deck
    attr_reader :suit, :value, :rank
    def initialize(card)
        @card = card
    end

    def remove_card
        @card.pop


end
