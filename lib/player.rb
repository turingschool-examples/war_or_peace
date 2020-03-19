#player class


class Player
    attr_reader :deck, :name

    def initialize (name, deck)
      @name = name
      @deck = deck
    end

    def has_lost?
      if @deck.cards.empty? == true
        return true
      else @deck.cards.empty? == false
        return false
      end
    end


end
