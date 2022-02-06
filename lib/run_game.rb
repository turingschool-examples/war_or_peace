require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class RunGame

  def welcome_prompt
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts 'The players today are Megan and Aurora.'
    puts 'Type "GO" to start the game!'
    puts '------------------------------------------------------------------'

    lets_go = gets.chomp.downcase
    until lets_go == 'go' do
      puts 'Nice try, but "GO" is spelled "GO".'
      lets_go = gets.chomp.downcase
    end
    go = RunGame.new.game_start

  end

  def game_start
    general_deck = Deck.new.full_deck.shuffle!
    deck1 = Deck.new(general_deck[0..25])
    deck2 = Deck.new(general_deck[26..51])
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn_number = 0

    until player1.has_lost? || player2.has_lost? || turn_number == 1000000 do
      turns = Turn.new(player1, player2)
      turn_number += 1

      turns.pile_cards
        if turns.type == :basic
          turns.award_spoils(turns.winner)
        puts "Turn #{turn_number + 1}: #{turns.winner.name} won 2 cards"

        elsif turns.type == :war
          # exact_winner = turns.winner
          turns.award_spoils(turns.winner)
          puts "Turn #{turn_number + 1}: WAR - #{turns.winner.name} won 6 cards"


        elsif turns.type == :mutually_assured_destruction
          puts "Turn #{turn_number}: *mutually assured destruction* 6 cards removed from play"
        end
    end #end of until loop
    # binding.pry

    if player1.has_lost? == true && player2.has_lost? == true
      puts 'draw'
    elsif player1.has_lost? == true || player2.deck.cards == nil
      puts "*~*~*~* Aurora has won the game! *~*~*~*"
    elsif player2.has_lost? == true || player1.deck.cards == nil
      puts "*~*~*~* Megan has won the game! *~*~*~*"
    else
      puts "draw"
    end

  end #end of game_start method

end # END OF CLASS
