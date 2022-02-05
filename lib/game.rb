require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end


  def start
    i = 0
    until @turn.player1.deck.cards.count == [] || @turn.player2.deck.cards.count== [] || i == 1000000
      # binding.pry
      i += 1
      type = @turn.type
      # binding.pry

      winner = @turn.winner
# binding.pry
      spoils_count = @turn.spoils_count
      # binding.pry
      @turn.pile_cards
      spoils_of_war = @turn.spoils_of_war
      @turn.award_spoils(winner)

      if type == :basic
          puts "Turn #{i}: #{winner.name} won 2 cards"
      elsif type == :war
          puts "Turn #{i}: #{winner.name} won 6 cards"
      elsif type == :mutually_assured_destruction
       puts "*mutually assured destruction* 6 cards removed from play"
      end
    @turn_count = i
    end
# binding.pry
    player1_final_card_num = @turn.player1.deck.cards.count.to_s
    player2_final_card_num = @turn.player2.deck.cards.count.to_s
    if @turn.player1.deck.cards.count <3
      puts "*~*~*~*#{@turn.player2.name}*~*~*~* has won the game with #{player2_final_card_num} cards!"
    elsif @turn.player2.deck.cards.count <3
      puts "*~*~*~*#{@turn.player1.name}*~*~*~* has won the game with #{player1_final_card_num} cards!"
    elsif @turn_count == 1000000
        puts "---- DRAW ----"
    end

# binding.pry
  end
end
