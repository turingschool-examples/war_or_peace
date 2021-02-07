require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require "pry"
class Game

  def initialize
  end

  def start
    player_names = get_players
    create_players_and_decks(player_names)
    input = introduction
    play_loop if input == 'GO'
    p "that's not an option!" if input != 'GO'

  end

  def introduction
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{@player_1.name} and #{@player_2.name}."
    puts "Type 'GO' to start the game!"
    puts "-" * 65
    gets.chomp.upcase
  end

  def create_players_and_decks(player_names)
    deck1 = Deck.new
    shuffle_deck = deck1.cards.shuffle
    left,right = shuffle_deck.each_slice((shuffle_deck.size/2.0).round).to_a
    deck1.cards = left
    deck2 = Deck.new(right)
    @player_1 = Player.new(player_names[0], deck1)
    @player_2 = Player.new(player_names[1], deck2)
    
  end


  def get_players
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "Please Enter Player One's Name: "
    @player_1 = gets.chomp.capitalize
    p "------------------------------------------------------------------"
    puts "Hello #{@player_1}! Welcome to War! (or Peace)"
    puts "Please Enter Player Two's Name: "
    @player_2 = gets.chomp.capitalize
    p "------------------------------------------------------------------"
    puts "Hello #{@player_2}! Welcome to War! (or Peace)"
    return [@player_1, @player_2]
  end

  def play_loop
    n = 1
    until @player_1.has_lost? == true || @player_2.has_lost? == true
      break if n > 100  #change back to 999,999
      turn = Turn.new(@player_1, @player_2)
      type = turn.type
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      state_winner(type, winner, n)
      n += 1
    end

  end


  def state_winner(type, winner, round)
    if type == :basic
      p "Turn #{round}: #{winner.name} won 2 cards"
    elsif type == :war
      p "Turn #{round}: WAR - #{winner.name} won 6 cards"
    else
      p "Turn #{round}: *mutually assured destruction* 6 cards removed from play"
    end
  end

end
