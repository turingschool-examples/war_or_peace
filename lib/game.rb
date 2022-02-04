require './card'
require './deck'
require './player'
require './turn'

class Game
    attr_reader :p1name, :p2name, :built_deck, :turn_count, :player1, :player2, :winner
    def initialize(p1name, p2name)
      @p1name = p1name
      @p2name = p2name
      @turn_count = 1
      @built_deck = []
      @player1 = nil
      @player2 = nil
      @winner = nil
    end

    def build_deck
        ranks = ["Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King", "Ace"]
        hearts_count = 0
        diamonds_count = 0
        clubs_count = 0
        spades_count = 0
            while hearts_count < 13
                built_deck.append(Card.new(:hearts, ranks[hearts_count], hearts_count + 2))
                hearts_count += 1
            end
            while diamonds_count < 13
                built_deck.append(Card.new(:diamonds, ranks[diamonds_count], diamonds_count + 2))
                diamonds_count += 1
            end
            while clubs_count < 13
                built_deck.append(Card.new(:clubs, ranks[clubs_count], clubs_count + 2))
                clubs_count += 1
            end
            while spades_count < 13
                built_deck.append(Card.new(:spades, ranks[spades_count], spades_count + 2))
                spades_count += 1
            end
        end

        def assign_decks
            p1deck = Deck.new(built_deck.shuffle)
            p2deck = Deck.new(built_deck.shuffle)

            @player1 = Player.new(p1name, p1deck)
            @player2 = Player.new(p2name, p2deck)
        end
end