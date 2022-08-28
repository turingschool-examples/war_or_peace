require './lib/player'
require './lib/card'
require './lib/deck'
require './lib/turn'

class Game
  attr_reader :player1, :player2
  def initialize

    suits = [:diamond, :heart, :spade, :club]
    deck52 = Deck.new([])

    suits.each do |suit|
      for i in 2..10 do
        deck52.add_card(Card.new(suit, i.to_s, i))
      end

      deck52.add_card(Card.new(suit, 'Jack', 11))
      deck52.add_card(Card.new(suit, 'Queen', 12))
      deck52.add_card(Card.new(suit, 'King', 13))
      deck52.add_card(Card.new(suit, 'Ace', 14))
    end

    deck52.cards.shuffle!

    deck1 = Deck.new(deck52.cards[0..25])
    deck2 = Deck.new(deck52.cards[26..51])

    @player1 = Player.new('Trish', deck1)
    @player2 = Player.new('Lua', deck2)



  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are #{@player1.name} and #{@player2.name}.
Type 'GO' to start the game!
------------------------------------------------------------------"
    a = gets.chomp
    if a == 'GO'
      turn_count = 0
      continue_game = true
      while continue_game == true
        turn_count += 1
        turn = Turn.new(@player1, @player2)
        type = turn.type
        winner = turn.winner
        turn.pile_cards
        if type == :basic
          p "Turn #{turn_count}: #{winner.name} won 2 cards"
          turn.award_spoils(winner)
        elsif type == :war
          p "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"
          turn.award_spoils(winner)
        elsif type == :mutually_assured_destruction
          p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
        end
        if @player1.deck.cards.length == 0 || @player2.deck.cards.length == 0
          continue_game = false
          p "*~*~*~* #{winner.name} has won the game! *~*~*~*"
        end
        if turn_count >= 99999
          continue_game = false
          p '*~*~*~* Peace was brokered! *~*~*~*'
        end
      end
    end
  end
end

game = Game.new
game.start
