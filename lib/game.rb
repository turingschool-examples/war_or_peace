require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class Game
  def initialize
    @round = 1
    @shuffled_cards = CardGenerator.new('cards.txt').cards.shuffle
    @deck1 = Deck.new(@shuffled_cards[0..25])
    @deck2 = Deck.new(@shuffled_cards[26..51])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end

  def start
    until @player1.has_lost? || @player2.has_lost? || @round == 1_000_001
      turn = Turn.new(@player1, @player2)
      winner = turn.winner
      type = turn.type
      turn.pile_cards
      turn.award_spoils(winner)

      if type == :basic
        puts "Turn #{@round}: #{winner.name} won 2 cards"
      elsif type == :war
        puts "Turn #{@round}: WAR - #{winner.name} won 6 cards"
      elsif type == :mutually_assured_destruction
        puts "Turn #{@round}: *mutually assured destruction* 6 cards removed from play"
      end

      @round += 1

    end
    if turn.player1.has_lost?
      p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
    elsif turn.player2.has_lost?
      p "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
    elsif @round == 1_000_001
      p '--- DRAW ---'
    end
  end
end
