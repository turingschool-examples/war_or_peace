require "pry"

class Start
  attr_reader :turn

  def initialize(turn)
    @turn = turn
    input = ''
    until input == 'go' || input == 'Go' ||input == 'GO'
      puts "Welcome to War! (or Peace) This game will be played with 52 cards.
      The players today are #{@player1} and #{@player2}.
      Type 'GO' to start the game!
      ------------------------------------------------------------------------"
      input = gets.chomp
      if input == 'go' || input == 'Go' ||input == 'GO'
        # @start_game = true
      puts "-------------------------Game On!---------------------------------"
        play_war
      else
        puts "Invalid input"
      end
    end
  end

  def new_turn
    # turn.type
    # winner = turn.winner
    # turn.pile_cards
    # turn.award_spoils(winner)

    turn.type
    winner = turn.winner
    if turn.forfeit != true
      turn.pile_cards
      turn.award_spoils(winner)
    end
  end #new turn

  def play_war
    turn_num = 0

    loop do
      turn_num += 1
      new_turn
      #puts "p1 cards: #{master_start.turn.player1.deck.cards}"
      #puts "p1 cards: #{master_start.turn.player2.deck.cards}"
      if turn.player1.has_lost? && turn.player2.has_lost?
        puts "DRAW"
        puts "turn_num #{turn_num}"
        puts "p1 cards: #{turn.player1.deck.cards.length}"
        puts "p1 cards: #{turn.player2.deck.cards.length}"
        break
      elsif turn.player1.has_lost?
        puts "player 2 wins"
        puts "turn_num #{turn_num}"
        puts "p1 cards: #{turn.player1.deck.cards.length}"
        puts "p1 cards: #{turn.player2.deck.cards.length}"
        break
      elsif turn.player2.has_lost?
        puts "player1 wins"
        puts "turn_num #{turn_num}"
        puts "p1 cards: #{turn.player1.deck.cards.length}"
        puts "p1 cards: #{turn.player2.deck.cards.length}"
        break
      elsif turn.forfeit
        puts "forfeit! #{turn.forfeit_winner} wins by forfeit"
        puts "turn_num #{turn_num}"
        puts "p1 cards: #{turn.player1.deck.cards.length}"
        puts "p1 cards: #{turn.player2.deck.cards.length}"
        break

      elsif turn_num > 1000000
        puts "turn_num #{turn_num}"
        puts "p1 cards: #{turn.player1.deck.cards.length}"
        puts "p1 cards: #{turn.player2.deck.cards.length}"
        break
      end


    end #loop

  end#play war

end # final





#
#
#
#
#
#
# def start
#   @start_game = true
#   # puts "Welcome to War! (or Peace) This game will be played with 52 cards.
#   # The players today are #{@player1} and #{@player2}.
#   # Type 'GO' to start the game!
#   # ------------------------------------------------------------------------"
#   # input = gets.chomp
#   # if input == 'go' || input == 'Go' ||input == 'GO'
#   #   puts "WE DID IT"
#   #   @start_game = true
#   # else
#   #   puts "Invalid input"
#   # end
#
#   turn_num = 1
#     loop do
#       if @player1.has_lost?
#         puts "Turn num #{turn_num}"
#         puts "~*~*~*~*~*#{@player2.name} has won!~*~*~*~*~*"
#         puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
#         break
#       elsif @player2.has_lost?
#         puts "Turn num #{turn_num}"
#         puts "~*~*~*~*~*#{@player1.name} has won!~*~*~*~*~*"
#         puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
#         break
#       end
#       #puts "p1: #{@player1.deck.cards.length}"
#       #puts "p2: #{@player2.deck.cards.length}"
#     #  puts "#{@player1.deck.rank_of_card_at(0)} v #{@player2.deck.rank_of_card_at(0)} #{type}"
#       type
#       if @player1_forfeit
#         puts "Turn num #{turn_num} #{type}"
#         puts "#{@player1.deck.cards[0].rank} #{@player1.deck.cards[0].suit} v #{@player2.deck.cards[0].rank} #{@player2.deck.cards[0].suit}"
#         puts "#{@player1.deck.cards[1].rank} #{@player1.deck.cards[1].suit} v #{@player2.deck.cards[1].rank} #{@player2.deck.cards[1].suit}"
#         puts puts "~*~*~*~*~*#{@player1.name} has forfieted!~*~*~*~*~*"
#         puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
#         break
#       end
#       if @player2_forfeit
#         puts "Turn num #{turn_num} #{type}"
#         puts "#{@player1.deck.cards[0].rank} #{@player1.deck.cards[0].suit} v #{@player2.deck.cards[0].rank} #{@player2.deck.cards[0].suit}"
#         puts "#{@player1.deck.cards[1].rank} #{@player1.deck.cards[1].suit} v #{@player2.deck.cards[1].rank} #{@player2.deck.cards[1].suit}"
#         puts puts "~*~*~*~*~*#{@player2.name} has forfeited!~*~*~*~*~*"
#         puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
#         break
#       end
#       if @draw
#           puts "Turn num #{turn_num}"
#           puts puts "~*~*~*~*~*Draw!~*~*~*~*~*"
#           puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
#           break
#       end
#
#
#
#       winner
#       pile_cards
#       award_spoils
#       turn_num += 1
#       if turn_num > 1000000
#         puts "Turns Maxed out #{turn_num}"
#         break
#       end
#
#       #puts "Turn num #{turn_num}"
#
#
#       # if type.to_s == "mutually_assured_destruction"
#       #  puts "MAD"
#       #  break
#       # elsif type.to_s == "war"
#       #  puts "WAR"
#       #  break
#       # end
#   end
# #end
