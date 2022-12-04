require './lib/game'
require './lib/player'
require './lib/deck'
require './lib/turn'

def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "If you don't want to play, press any key to exit the game."

    if gets.chomp.downcase == "go"
        game = Game.new
        @game_turn = Turn.new(game.player1, game.player2)
        i = 0
        until game.player1.has_lost? || game.player2.has_lost? do
            # require 'pry'; binding.pry
            type = @game_turn.type
            round_winner = @game_turn.winner
            @game_turn.pile_cards
            if type == :basic
                @game_turn.award_spoils(round_winner)
                i += 1
                p "Turn #{i}: #{@game_turn.winner.name} won 2 cards"
            elsif type == :war
                @game_turn.award_spoils(round_winner)
                i += 1
                p "Turn #{i}: WAR - #{@game_turn.winner.name} won 6 cards"
            else type == :mutually_assured_destruction
                require 'pry'; binding.pry
                i += 1
                p "Turn #{i}: *mutually assured destruction* 6 cards removed from play"
            end
        end

        if game.player1.has_lost? == true || game.player1.deck.cards == 0
            p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
        elsif game.player2.has_lost? == true || game.player2.deck.cards == 0
            p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
        else game.player1.deck.cards == 0 && game.player2.deck.cards == 0 || @game_turn.count == 1000000
            p "---- DRAW ----"
        end
    else 
        p "Thanks for playing!"
    end
    
    # x = Game.new
    
    # require 'pry'; binding.pry

end
start



# card1 = Card.new()
# card2 = Card.new()
# card3 = Card.new()

#suit
#rank
#value

# suits = [:heart, :diamond, :club, :spade]
# rank = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
# value = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

# deck = []

# # value.times do |value|

# rank.each_with_index do |rank, index|
#     suits.each do |suit|
#         deck << Card.new(suit, rank, index + 2)
#     end
# end

# # rank.each do |rank|
# #     value.each do |value|
# #         suits.each do |suit|
# #             deck << Card.new(suit, rank, value)
# #         end
# #     end
# # end

# # p deck.length


# # deck1 = Deck.new()
# # deck2 = Deck.new

# deck1 = deck.sample(26)

# deck2 = deck1.each do |card|
#     deck.delete(card)
# end
# require 'pry'; binding.pry
