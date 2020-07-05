require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

deck = []
deck2 = []
deck << card1 = Card.new(:diamond, '2', 2)
deck << card2 = Card.new(:diamond, '3', 3)
deck << card3 = Card.new(:diamond, '4', 4)
deck << card4 = Card.new(:diamond, '5', 5)
deck << card5 = Card.new(:diamond, '6', 6)
deck << card6 = Card.new(:diamond, '7', 7)
deck << card7 = Card.new(:diamond, '8', 8)
deck << card8 = Card.new(:diamond, '9', 9)
deck << card9 = Card.new(:diamond, '10', 10)
deck << card10 = Card.new(:diamond, 'Jack', 11)
deck << card11 = Card.new(:diamond, 'Queen', 12)
deck << card12 = Card.new(:diamond, 'King', 13)
deck << card13 = Card.new(:diamond, 'Ace', 14)
deck << card14 = Card.new(:heart, '2', 2)
deck << card15 = Card.new(:heart, '3', 3)
deck << card16 = Card.new(:heart, '4', 4)
deck << card17 = Card.new(:heart, '5', 5)
deck << card18 = Card.new(:heart, '6', 6)
deck << card19 = Card.new(:heart, '7', 7)
deck << card20 = Card.new(:heart, '8', 8)
deck << card21 = Card.new(:heart, '9', 9)
deck << card22 = Card.new(:heart, '10', 10)
deck << card23 = Card.new(:heart, 'Jack', 11)
deck << card24 = Card.new(:heart, 'Queen', 12)
deck << card25 = Card.new(:heart, 'King', 13)
deck << card26 = Card.new(:heart, 'Ace', 14)
deck << card27 = Card.new(:spade, '2', 2)
deck << card28 = Card.new(:spade, '3', 3)
deck << card29 = Card.new(:spade, '4', 4)
deck << card30 = Card.new(:spade, '5', 5)
deck << card31 = Card.new(:spade, '6', 6)
deck << card32 = Card.new(:spade, '7', 7)
deck << card33 = Card.new(:spade, '8', 8)
deck << card34 = Card.new(:spade, '9', 9)
deck << card35 = Card.new(:spade, '10', 10)
deck << card36 = Card.new(:spade, 'Jack', 11)
deck << card37 = Card.new(:spade, 'Queen', 12)
deck << card38 = Card.new(:spade, 'King', 13)
deck << card39 = Card.new(:spade, 'Ace', 14)
deck << card40 = Card.new(:club, '2', 2)
deck << card41 = Card.new(:club, '3', 3)
deck << card42 = Card.new(:club, '4', 4)
deck << card43 = Card.new(:club, '5', 5)
deck << card44 = Card.new(:club, '6', 6)
deck << card45 = Card.new(:club, '7', 7)
deck << card46 = Card.new(:club, '8', 8)
deck << card47 = Card.new(:club, '9', 9)
deck << card48 = Card.new(:club, '10', 10)
deck << card49 = Card.new(:club, 'Jack', 11)
deck << card50 = Card.new(:club, 'Queen', 12)
deck << card51 = Card.new(:club, 'King', 13)
deck << card52 = Card.new(:club, 'Ace', 14)

deck.shuffle!
deck2.concat(deck.slice!(0..25))
@deck1 = Deck.new(deck)
@deck2 = Deck.new(deck2)
@player1 = Player.new("Megan", @deck1)
@player2 = Player.new("Aurora",@deck2)
@turn = Turn.new(@player1, @player2)
p @player1.deck.cards.size
p @player2.deck.cards.size


def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    input = gets.chomp!
      if input == "Go" ||input == "GO" ||input == "go"
        turn_count = 1
          until @player1.has_lost? == true || @player2.has_lost? == true || @turn_count == 1000000 do
           @turn.type
           #if type is MAD or war and player has less than 3
           #other player wins!
            if (@turn.type == :mutually_assured_destruction || @turn.type == :war) &&
              if @player1.deck.cards.length < 3
                p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
                p "MAD"
              elsif @player2.deck.cards.length < 3
                p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
                p "MAD"
              end #nested
              break
            end #if type

           @turn.winner
           @turn.spoils_of_war
           #@turn.pile_cards
           @turn.award_spoils(@turn.winner)
           binding.pry
           #deck length
           p "#{@player1.deck.cards.length} p1"
           p "#{@player2.deck.cards.length} p2"
            if @turn.type == :basic
              p "Turn #{turn_count}: #{@turn.type} - #{@turn.winner.name} won #{@turn.pile_cards.count} cards!"
            elsif @turn.type == :mutually_assured_destruction
              p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
            elsif @turn.type == :war
              p "Turn #{turn_count}: WAR - #{@turn.winner.name} won #{@turn.pile_cards.count} cards!"
            end #if turn type end
          turn_count += 1

        end #until
        if @player1.has_lost? == true
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          p "#{@player1.deck.cards.length} p1"
          p "#{@player2.deck.cards.length} p2"
          p "#{@turn.spoils_of_war} pile cards"

        elsif @player2.has_lost? == true
          p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
          p "#{@player1.deck.cards.length} p1"
          p "#{@player2.deck.cards.length} p2"
          p "#{@turn.spoils_of_war} pile cards"
        end

      end #if input end
    end  #def start end
#TYPE IS CHANGING
p start

# make a test file and have MAD or war come up with not enough cards in player deck

#   #until @player1.has_lost? || @player2.has_lost? || turn_count == 0
