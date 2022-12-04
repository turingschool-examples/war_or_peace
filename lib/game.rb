require './lib/card'
require './lib/player'
require './lib/deck'
require './lib/turn'

class Game
    attr_reader :deck1, :deck2, :player1, :player2
    def initialize
        @deck1 = Deck.new
        @deck2 = Deck.new
        @deck = build_decks.shuffle
        @player1 = Player.new("Megan", @deck1)
        @player2 = Player.new("Aurora", @deck2)
    end

    def build_decks
        deck = []

        suits = [:heart, :diamond, :club, :spade]
        rank = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
        value = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

        rank.each_with_index do |rank, index|
            suits.each do |suit|
                deck << Card.new(suit, rank, index + 2)
            end
        end

   
        random = deck.sample(26)
        random.each do |card|
            @deck1.cards << card
        end.compact
        
         @deck1.cards.each do |card|
            deck.delete(card)        
        end
        
        deck.each do |card|
            @deck2.cards << card
        end.compact
    end

end