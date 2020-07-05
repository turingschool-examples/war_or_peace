require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

deck = []
deck2 = []
suits = [:spade, :diamond, :heart, :club]
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10]
values = ["2", "3", "4", "5", "6", "7", "8", "9", "10"]

suits.each do |suit|
  ranks.each do |rank|
    card = Card.new(suit, "#{rank}", rank)
      deck << card
  end
end
suits.each do |suit|
  card = Card.new(suit, "Jack", 11)
    deck << card
end
suits.each do |suit|
  card = Card.new(suit, "Queen", 12)
    deck << card
end
suits.each do |suit|
  card = Card.new(suit, "King", 13)
    deck << card
end
suits.each do |suit|
  card = Card.new(suit, "Ace", 14)
    deck << card
end


deck.shuffle!
deck2.concat(deck.slice!(0..25))
@deck1 = Deck.new(deck)
@deck2 = Deck.new(deck2)
@player1 = Player.new("Megan", @deck1)
@player2 = Player.new("Aurora",@deck2)

@turn = Turn.new(@player1, @player2)
# p @player1.deck.cards.size
# p @player2.deck.cards.size

def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    input = gets.chomp!
      if input == "Go" ||input == "GO" ||input == "go"
        turn_count = 1
          until @player1.has_lost? == true || @player2.has_lost? == true || turn_count == 1000001 do
           # @turn.type
             if @player1.deck.cards.length < 3
               p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
               break
             elsif @player2.deck.cards.length < 3
               p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
               break
              end

           @turn.winner
           @turn.spoils_of_war
#           @turn.award_spoils(@turn.winner)

           # p "#{@player1.deck.cards.length} p1"
           # p "#{@player2.deck.cards.length} p2"
            if @turn.type == :basic
              @turn.award_spoils(@turn.winner)
               p "Turn #{turn_count}: #{@turn.type} - #{@turn.winner.name} won #{@turn.pile_cards.count} cards!"
            elsif @turn.type == :mutually_assured_destruction
              @turn.award_spoils(@turn.winner)
               p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
            elsif @turn.type == :war
              @turn.award_spoils(@turn.winner)
              p "Turn #{turn_count}: WAR - #{@turn.winner.name} won #{@turn.pile_cards.count} cards!"
            end #if turn type end

          turn_count += 1


        end #until

        if @player1.has_lost? == true
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        elsif @player2.has_lost? == true
          p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        elsif turn_count == 1000001
          p "---- DRAW ----"
        end

      end #if input end
    end  #def start end

start
