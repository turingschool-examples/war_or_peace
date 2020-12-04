require './lib/standard_deck'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :standard_deck,
              :turns

  def initialize
    @standard_deck = StandardDeck.new
    @turns = []
  end

  def split_deck
    @standard_deck.create_standard_deck
    shuffled_deck = @standard_deck.cards.shuffle
    create_first_deck(shuffled_deck[0..25])
    create_second_deck(shuffled_deck[26..52])
  end

  def create_first_deck(shuffled_deck)
    @deck1 = Deck.new(shuffled_deck)
  end

  def create_second_deck(shuffled_deck)
    @deck2 = Deck.new(shuffled_deck)
  end

  def create_two_players(player1_name, player2_name)
    split_deck
    create_first_player(player1_name, @deck1)
    create_second_player(player2_name, @deck2)
  end

  def create_first_player(name, deck)
    @player1 = Player.new(name, deck)
  end

  def create_second_player(name, deck)
    @player2 = Player.new(name, deck)
  end

  def add_turn
    @turns << Turn.new(@player1, @player2)
  end

  def turn_output(turn_number)
    print "Turn #{turn_number}: "
    type = @turns.last.type
    if type == :basic
      print "#{@turns.last.winner.name} won "
      @turns.last.pile_cards
      puts "#{@turns.last.spoils_of_war.length} cards"
      @turns.last.award_spoils(@turns.last.winner)
    elsif type == :war
      print "#{type.upcase} - #{@turns.last.winner.name} won "
      @turns.last.pile_cards
      puts "#{@turns.last.spoils_of_war.length} cards"
      @turns.last.award_spoils(@turns.last.winner)
    elsif type == :mutually_assured_destruction
      puts "*#{type}* 6 cards removed from play"
      @turns.last.pile_cards
    end
  end

  def start
    create_two_players("Angel", "Amber")
    greeting
    user_input = gets.chomp
    while user_input.upcase != "GO"
      puts "Invalid Input. Try again: "
      user_input = gets.chomp
    end
    while !game_over?
      if @turns.length < 1000000
        add_turn
        if @turns.length > 0
          turn_output(@turns.length)
        end
      else
        puts "DRAW".center(14, "-")
      end
    end
      puts display_winner
  end

  def game_over?
    @player1.deck.cards.length <= 3 || @player2.deck.cards.length <= 3
  end

  def greeting
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{@player1.name} and #{@player2.name}."
    puts "Type 'GO' to start the game!"
    50.times do
      print "-"
    end
    puts "\n"
  end

  def display_winner
    if @player1.deck.cards.length > @player2.deck.cards.length
      "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    else
      "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    end
  end
end
