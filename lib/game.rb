require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class Game
    attr_reader :cards,
                :deck1,
                :deck2,
                :player1,
                :player2,
                :turn
def initialize(cards)
    @cards = cards.shuffle
    @deck1 = Deck.new(@cards[0..25])
    @deck2 = Deck.new(@cards[26..51])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
    @turn = Turn.new(@player1, player2)
end 
    def start
        p 'Welcome to War!(or Peace) This game will be played with 52 cards.'
        p 'The players today are Megan and Aurora.'
        p "Type 'GO' to start the game!"
        p '--------------------------------------------------------------------'
        
        begin_game = gets.strip
        if begin_game.upcase == "GO"
            turn
        else 
            exit
        end 
    end 

    def play_game
        turn_number = 0
until player1.has_lost? || player2.has_lost?
    turn_type = turn.type
    winner = turn.winner
    turn.pile_cards
    spoils_of_war_count = turn.spoils_of_war.count
    turn.spoils_of_war.shuffle!

    if turn_type == :basic
        turn.award_spoils(winner)
        p "Turn #{turn_number += 1}: #{winner.name} won #{spoils_of_war_count} cards"
    elsif turn_type == :war
        turn.award_spoils(winner)
        p "Turn #{turn_number += 1}: WAR - #{winner.name} won #{spoils_of_war_count} cards"
    elsif turn_type == :mutually_assured_destruction
        p "Turn #{turn_number += 1}: *mutually assured destruction* 6 cards removed from play"
    end 

    if player1.deck.cards.count < 3
        player1.deck.cards.clear
    elsif player2.deck.cards.count < 3
        player2.deck.cards.clear
    end 

    if turn_number == 1_000_000
        break
    end
end 

    if turn_number == 1_000_000
         p '---- DRAW ----'
    elsif player1.has_lost? == true
        p '*~*~*~* Aurora has won the game! *~*~*~*'
    elsif player2.has_lost? == true
        p '*~*~*~* Megan has won the game! *~*~*~*'
    end

    end
end