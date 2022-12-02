require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'



puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
puts "Type 'GO' to start the game!"
puts "The players today are Megan and Aurora."
puts '------------------------------------------------------------------'

answer = gets.chomp
if answer == 'GO'
    game = Game.new
    game.start
    game.split_deck
else
    exit
end



player1_deck = game.individual_deck[0]
player2_deck = game.individual_deck[1]
deck1 = Deck.new(player1_deck)
deck2 = Deck.new(player2_deck)

# card1 = Card.new(:heart, 'Jack', 13)
# card2 = Card.new(:heart, '10', 10)
# card3 = Card.new(:heart, '9', 9)
# card4 = Card.new(:diamond, 'Jack', 13)
# card5 = Card.new(:heart, '8', 8)
# card6 = Card.new(:diamond, 'Queen', 12)
# card7 = Card.new(:heart, '3', 3)
# card8 = Card.new(:diamond, '2', 2)
# deck1 = Deck.new([card1, card2, card5, card8])
# deck2 = Deck.new([card4, card3, card6, card7])
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)
turn = Turn.new(player1, player2)


turn_acc = 0
until player1.deck.cards.count == 0 || player2.deck.cards.count == 0

    if turn.type == :mutually_assured_destruction
        turn.pile_cards
        turn_acc += 1
        puts "*mutually assured destruction* 6 cards removed from play"
    elsif turn.type == :war
        # require 'pry'; binding.pry
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        turn_acc += 1
        # require 'pry'; binding.pry
        puts "Turn #{turn_acc}: WAR - #{winner.name} won 6 cards"
    elsif turn.type == :basic
        # require 'pry'; binding.pry
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        turn_acc += 1
        puts "Turn #{turn_acc}: #{winner.name} has won 2 cards"
    end
end

if player1.deck.cards.count == 0
    puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
elsif player2.deck.cards.count == 0
    puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
end

# Adding a note here for myself. Enumerator objects were interesting because they can hold arrays but don't necessarily return them unless you use an enumerator method on them. Enumerator objects can also be converted down to arrays with the .to_a method seen above.