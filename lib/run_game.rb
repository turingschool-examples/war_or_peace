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
      if lets_go == 'go'
        go = RunGame.new.game_start
      else
        puts 'Nice try, but "GO" is spelled "GO". Type "GO" to start the game!'
      end
  end

  def game_start
    general_deck = Deck.new.full_deck
    shuffled_deck = general_deck.shuffle
    deck1 = Deck.new(shuffled_deck[0..25])
    deck2 = Deck.new(shuffled_deck[26..51])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turns = Turn.new(player1, player2)

    turn_number = 0
      if turns.type == :basic
        # turn_number + 1
        turns.pile_cards
        turns.award_spoils(turns.winner)
        puts "Turn #{turn_number + 1}: #{turns.winner.name} won 2 cards"

      elsif turns.type == :war
        # turn_number + 1
        turns.pile_cards
        turns.award_spoils(turns.winner)
        puts "Turn #{turn_number + 1}: WAR - #{turns.winner.name} won 6 cards"

      elsif turns.type == :mutually_assured_destruction
        # turn_number + 1
        turns.pile_cards
        turns.award_spoils(turns.winner)
        puts "Turn #{turn_number + 1}: *mutually assured destruction* 6 cards removed from play"
      end
  end

  # def turn_count
  #   + 1
  # end
end


# end
