class Game
    attr_accessor :start

    def initialize
    end

    def start
        "Welcome to War! (or Peace) This game will be played with 52 cards.
        The players today are #{player1} and #{player2}. 
        Type 'GO' to start the game!"
    end

    # def deck
    #     [(:heart, '2', 2),(:heart, '3', 3),(:heart, '4', 4),(:heart, '5', 5),(:heart, '6', 6),(:heart, '7', 7),(:heart, '8', 8),(:heart, '9', 9),(:heart, '10', 10),(:heart, 'Jack', 11),(:heart, 'Queen', 12),(:heart, 'King', 13),(:heart, 'Ace', 14),(:diamond, '2', 2),(:diamond, '3', 3),(:diamond, '4', 4),(:diamond, '5', 5),(:diamond, '6', 6),(:diamond, '7', 7),(:diamond, '8', 8),(:diamond, '9', 9),(:diamond, '10', 10),(:diamond, 'Jack', 11),(:diamond, 'Queen', 12),(:diamond, 'King', 13),(:diamond, 'Ace', 14), (:clubs, '2', 2),(:clubs, '3', 3),(:clubs, '4', 4),(:clubs, '5', 5),(:clubs, '6', 6),(:clubs, '7', 7),(:clubs, '8', 8),(:clubs, '9', 9),(:clubs, '10', 10),(:clubs, 'Jack', 11),(:clubs, 'Queen', 12),(:clubs, 'King', 13),(:clubs, 'Ace', 14),(:spade, '2', 2),(:spade, '3', 3),(:spade, '4', 4),(:spade, '5', 5),(:spade, '6', 6),(:spade, '7', 7),(:spade, '8', 8),(:spade, '9', 9),(:spade, '10', 10),(:spade, 'Jack', 11),(:spade, 'Queen', 12),(:spade, 'King', 13),(:spade, 'Ace', 14)]
    # end
end