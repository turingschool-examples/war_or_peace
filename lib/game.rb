require './lib/turn'
require './lib/card_generator'

class Game
  attr_reader :full_deck,
              :deck1,
              :deck2

  def initialize
    @full_deck = CardGenerator.new('./lib/cards.txt').import_cards
    @full_deck.shuffle!
    @deck1     = Deck.new(@full_deck[0..25])
    @deck2     = Deck.new(@full_deck[26..51])
    @player1   = Player.new('Megan', @deck1)
    @player2   = Player.new('Aurora', @deck2)
end

  def start
    response = gets.chomp
    while response != 'GO'
      puts "You entered '#{response}' dum-dum. Type GO to start a game."
      response = gets.chomp
    end
    turn_count = 0
    if response == "GO"
      loop do
        turn = Turn.new(@player1, @player2)
        turn.pile_cards
        turn.award_spoils
        if @player1.has_lost? == true || @player2.has_lost? == true
          puts "*~*~*~* #{@player1.name if @player1.has_lost? == false}#{@player2.name if @player2.has_lost? == false} has won the game! *~*~*~*"
          break
        elsif turn_count == 1_000_000
          p "---- DRAW ----"
          break
        end
        if turn.type == :mutually_assured_destruction
          puts "Turn #{turn_count + 1}: ** mutually assured destruction ** 6 cards removed from play"
        elsif turn.type == :war
          puts "Turn #{turn_count + 1}: WAR - #{turn.winner.name} won 6 cards."
        else
          puts "Turn #{turn_count + 1}: #{turn.winner.name} has won 2 cards."
        end
        turn_count += 1
      end
    end
  end
end
