require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class Game
    attr_reader :cards,
        :deck1,
        :deck2,
        :player1,
        :player2,
        :turn


    def initialize
        @deck1 = Deck.new([])
        @deck2 = Deck.new([])
        @player1 = Player.new("Megan", @deck1)
        @player2 = Player.new("Aurora", @deck2)
        @turn = Turn.new(@player1, @player2)
        @round_winner = ''

        @fresh_pack = [
        card1 = Card.new(:diamond, '2', 2),
        card15 = Card.new(:heart, '2', 2),
        card27 = Card.new(:spade, '2', 2),
        card40 = Card.new(:club, '2', 2),
        card2 = Card.new(:diamond, '3', 3),
        card16 = Card.new(:heart, '3', 3),
        card28 = Card.new(:spade, '3', 3),
        card41 = Card.new(:club, '3', 3),
        card3 = Card.new(:diamond, '4', 4),
        card17 = Card.new(:heart, '4', 4),
        card29 = Card.new(:spade, '4', 4),
        card42 = Card.new(:club, '4', 4),
        card4 = Card.new(:diamond, '5', 5),
        card18 = Card.new(:heart, '5', 5),
        card30 = Card.new(:spade, '5', 5),
        card43 = Card.new(:club, '5', 5),
        card5 = Card.new(:diamond, '6', 6),
        card19 = Card.new(:heart, '6', 6),
        card31 = Card.new(:spade, '6', 6),
        card44 = Card.new(:club, '6', 6),
        card6 = Card.new(:diamond, '7', 7),
        card20 = Card.new(:heart, '7', 7),
        card32 = Card.new(:spade, '7', 7),
        card45 = Card.new(:club, '7', 7),
        card7 = Card.new(:diamond, '8', 8),
        card21 = Card.new(:heart, '8', 8),
        card33 = Card.new(:spade, '8', 8),
        card46 = Card.new(:club, '8', 8),
        card8 = Card.new(:diamond, '9', 9),
        card22 = Card.new(:heart, '9', 9),
        card34 = Card.new(:spade, '9', 9),
        card47 = Card.new(:club, '9', 9),
        card9 = Card.new(:diamond, '10', 10),
        card23 = Card.new(:heart, '10', 10),
        card35 = Card.new(:spade, '10', 10),
        card48 = Card.new(:club, '10', 10),
        card10 = Card.new(:diamond, 'Jack', 11),
        card24 = Card.new(:heart, 'Jack', 11),
        card36 = Card.new(:spade, 'Jack', 11),
        card49 = Card.new(:club, 'Jack', 11),
        card11 = Card.new(:diamond, 'Queen', 12),
        card25 = Card.new(:heart, 'Queen', 12),
        card37 = Card.new(:spade, 'Queen', 12),
        card50 = Card.new(:club, 'Queen', 12),
        card12 = Card.new(:diamond, 'King', 13),
        card26 = Card.new(:heart, 'King', 13),
        card38 = Card.new(:spade, 'King', 13),
        card51 = Card.new(:club, 'King', 13),
        card13 = Card.new(:diamond, 'Ace', 14),
        card27 = Card.new(:heart, 'Ace', 14),
        card39 = Card.new(:spade, 'Ace', 14),
        card52 = Card.new(:club, 'Ace', 14)]

        26.times do
            @deck1.cards << @fresh_pack.sample
            @deck2.cards << @fresh_pack.sample
            #I found a bug that I don't have time to resolve before the deadline
            #For some reason the players decks contains THOUSANDS of cards
            #See the prints statements below.
        end
    end

    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are Megan and Aurora."
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"
       
        if gets.chomp.upcase == "GO"
            phases = 1

            until phases == 100
                if @player1.has_lost?
                    puts "#{player2.name} has WON!"
                    return
                elsif @player2.has_lost?
                    puts "#{player1.name} has WON!"
                    return
                else
                    type = @turn.type
                    @round_winner = @turn.winner
                    @turn.pile_cards

                    
                    if type == :mutually_assured_destruction
                        p "Turn #{phases}: *mutually assured destruction* 6 cards removed from play"
                    elsif type == :basic
                        turn.award_spoils(@round_winner)
                        puts "Turn #{phases}: #{@round_winner.name} won 2 cards"
                    else
                        turn.award_spoils(@round_winner)
                        p "Turn #{phases}: WAR - #{@round_winner.name} won 6 cards"
                    end
                    phases += 1
                end
                puts "player1.deck.count#{player1.deck.cards.count}"
                puts "deck1.count#{deck1.cards.count}"
            end
            puts "--------This game is a draw...--------"
        else
            start
        end
    end
end
