require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require 'pry'

full_deck = [card1 = Card.new(:heart, '2', 2),
card2 = Card.new(:club, '2', 2),
card3 = Card.new(:diamond, '2', 2),
card4 = Card.new(:spade, '2', 2),
card5 = Card.new(:heart, '3', 3),
card6 = Card.new(:club, '3', 3),
card7 = Card.new(:diamond, '3', 3),
card8 = Card.new(:spade, '3', 3),
card9 = Card.new(:heart, '4', 4),
card10 = Card.new(:club, '4', 4),
card11 = Card.new(:diamond, '4', 4),
card12 = Card.new(:spade, '4', 4),
card13 = Card.new(:heart, '5', 5),
card14 = Card.new(:club, '5', 5),
card15 = Card.new(:diamond, '5', 5),
card16 = Card.new(:spade, '5', 5),
card17 = Card.new(:heart, '6', 6),
card18 = Card.new(:club, '6', 6),
card19 = Card.new(:diamond, '6', 6),
card20 = Card.new(:spade, '6', 6),
card21 = Card.new(:heart, '7', 7),
card22 = Card.new(:club, '7', 7),
card23 = Card.new(:diamond, '7', 7),
card24 = Card.new(:spade, '7', 7),
card25 = Card.new(:heart, '8', 8),
card26 = Card.new(:club, '8', 8),
card27 = Card.new(:diamond, '8', 8),
card28 = Card.new(:spade, '8', 8),
card29 = Card.new(:heart, '9', 9),
card30 = Card.new(:club, '9', 9),
card31 = Card.new(:diamond, '9', 9),
card32 = Card.new(:spade, '9', 9),
card33 = Card.new(:heart, '10', 10),
card34 = Card.new(:club, '10', 10),
card35 = Card.new(:diamond, '10', 10),
card36 = Card.new(:spade, '10', 10),
card37 = Card.new(:heart, 'Jack', 11),
card38 = Card.new(:club, 'Jack', 11),
card39 = Card.new(:diamond, 'Jack', 11),
card40 = Card.new(:spade, 'Jack', 11),
card41 = Card.new(:heart, 'Queen', 12),
card42 = Card.new(:club, 'Queen', 12),
card43 = Card.new(:diamond, 'Queen', 12),
card44 = Card.new(:spade, 'Queen', 12),
card45 = Card.new(:heart, 'King', 13),
card46 = Card.new(:club, 'King', 13),
card47 = Card.new(:diamond, 'King', 13),
card48 = Card.new(:spade, 'King', 13),
card49 = Card.new(:heart, 'Ace', 14),
card50 = Card.new(:club, 'Ace', 14),
card51 = Card.new(:diamond, 'Ace', 14),
card52 = Card.new(:spade, 'Ace', 14)]

full_deck.shuffle!
deck1 = Deck.new([])
deck2 = Deck.new([])

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

26.times do
    player1.deck.cards << full_deck.shift
end

26.times do
    player2.deck.cards << full_deck.shift
end

start_game1 = Start.new

start_game1.welcome_message

x = 0
until x == 10000
    x += 1
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    if player1.deck.cards.length == 0 || player2.deck.cards.length == 0
        p "*~*~*~* #{winner.name} has won the game! *~*~*~*"
    elsif turn.type == :basic
        p "Turn #{x.to_s}: #{winner.name} won #{turn.spoils_of_war.length} cards"
    elsif turn.type == :war
        p "Turn #{x.to_s}: WAR - #{winner.name} won #{turn.spoils_of_war.length} cards"
    else
        p "Turn #{x.to_s}: *mutually assured destruction* 6 cards removed from play"
    end   
    turn.award_spoils_of_war(winner)
    
end





