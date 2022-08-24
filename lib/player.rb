require 'pry'
require_relative './card'
require_relative './deck'



class Player
    attr_reader :deck, :name

    def initialize(name, deck)
        @name = name
        @deck = deck
        # @has_lost = false  
    end 

    def has_lost?
        return true if @deck.cards.none?
        false
    end 
end 
# card1 = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3)
# card3 = Card.new(:heart, 'Ace', 14)
# deck = Deck.new([card1, card2, card3])
# player = Player.new('Clarisa', deck)



# player.deck.remove_card
# player.deck.remove_card
# player.deck.remove_card
# binding.pry